import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

/// Loads the remote SVG icon a `NetworkSvgIcon` draws.
///
/// flutter_svg parses whatever body it is given (an Azure 404 is an
/// `<Error>` XML page) and leaks a parse failure as an uncaught async error,
/// even with an `errorBuilder`; the app reports that as fatal. So the icon is
/// downloaded and parsed here first, and anything that fails emits null,
/// and the widget shows its error widget instead.
class NetworkSvgIconBloc {
  NetworkSvgIconBloc({Dio? dio}) : _dio = dio ?? _sharedDio;

  /// One client for every icon download, instead of one per widget.
  static final _sharedDio = Dio();

  final Dio _dio;

  // ponytail: unbounded and session-long; a company has a few dozen icon
  // URLs. Like flutter_svg's cache, a failed URL is not retried until
  // restart. Bound it with an LRU if icon counts grow.
  static final _downloads = <String, Future<String?>>{};

  /// Finished downloads, so a cached icon is emitted synchronously and draws
  /// on the widget's first frame.
  static final _icons = <String, String?>{};

  final _svgSubject = BehaviorSubject<String?>();

  /// The icon's SVG text, or null when it cannot be drawn.
  ValueStream<String?> get svgStream => _svgSubject.stream;

  Future<void> load(String url) async {
    if (_icons.containsKey(url)) {
      _svgSubject.add(_icons[url]);
      return;
    }
    final svg = await _downloads.putIfAbsent(
      url,
      () => _download(url).then((svg) => _icons[url] = svg),
    );
    // The widget may have been disposed while the icon downloaded.
    if (!_svgSubject.isClosed) {
      _svgSubject.add(svg);
    }
  }

  Future<String?> _download(String url) async {
    final List<int>? bytes;
    try {
      final response = await _dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      bytes = response.data;
    } on DioException {
      return null;
    }
    return _drawable(utf8.decode(bytes ?? const [], allowMalformed: true));
  }

  void dispose() {
    _svgSubject.close();
  }

  @visibleForTesting
  static void clearCache() {
    _downloads.clear();
    _icons.clear();
  }
}

/// [svg] if flutter_svg can parse it, else null. Parsed off the UI isolate,
/// as flutter_svg does; a top-level helper so the closure captures only
/// [svg].
Future<String?> _drawable(String svg) =>
    Isolate.run(() => _parses(svg) ? svg : null);

bool _parses(String svg) {
  try {
    parseWithoutOptimizers(svg);
    return true;
    // The parser rejects bad input with StateError and RangeError as well as
    // XmlParserException, so no narrower `on` clause covers it.
  } catch (_) {
    return false;
  }
}
