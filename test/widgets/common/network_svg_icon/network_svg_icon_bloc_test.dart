import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/network_svg_icon/network_svg_icon_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

const _url = 'https://blob.example/customtags/perfect.svg';
const _svg = '<svg xmlns="http://www.w3.org/2000/svg" width="20" '
    'height="20"><circle cx="10" cy="10" r="8"/></svg>';
const _blobNotFoundXml = '<?xml version="1.0" encoding="utf-8"?>'
    '<Error><Code>BlobNotFound</Code>'
    '<Message>The specified blob does not exist.</Message></Error>';

/// Answers every request with [respond] and counts the requests.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.respond);

  final Future<ResponseBody> Function() respond;
  int requests = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    requests++;
    return respond();
  }

  @override
  void close({bool force = false}) {}
}

Future<ResponseBody> _body(int statusCode, String body) async =>
    ResponseBody.fromString(body, statusCode);

void main() {
  late _FakeAdapter adapter;
  late NetworkSvgIconBloc bloc;

  NetworkSvgIconBloc newBloc() =>
      NetworkSvgIconBloc(dio: Dio()..httpClientAdapter = adapter);

  void respondWith(Future<ResponseBody> Function() respond) {
    adapter = _FakeAdapter(respond);
    bloc = newBloc();
  }

  tearDown(() {
    bloc.dispose();
    NetworkSvgIconBloc.clearCache();
  });

  test('load: blob is missing (404 BlobNotFound) → emits null', () async {
    respondWith(() => _body(404, _blobNotFoundXml));

    await bloc.load(_url);

    expect(bloc.svgStream.value, isNull);
  });

  test('load: connection fails → emits null', () async {
    respondWith(() => throw const SocketException('Failed host lookup'));

    await bloc.load(_url);

    expect(bloc.svgStream.value, isNull);
  });

  group('load: 200 body flutter_svg cannot draw', () {
    for (final (name, body) in [
      ('BlobNotFound XML', _blobNotFoundXml),
      ('empty body', ''),
      ('HTML page wrapping an <svg>', '<html><body>$_svg</body></html>'),
      ('truncated SVG', _svg.substring(0, 40)),
    ]) {
      test('$name → emits null', () async {
        respondWith(() => _body(200, body));

        await bloc.load(_url);

        expect(bloc.svgStream.value, isNull);
      });
    }
  });

  test('load: 200 SVG body → emits the SVG text', () async {
    respondWith(() => _body(200, _svg));

    await bloc.load(_url);

    expect(bloc.svgStream.value, _svg);
  });

  test('load: URL another bloc loaded → not downloaded again', () async {
    respondWith(() => _body(200, _svg));
    final other = newBloc();
    addTearDown(other.dispose);

    await other.load(_url);
    await bloc.load(_url);

    expect(adapter.requests, 1);
  });

  test('load: URL that failed for another bloc → not downloaded again',
      () async {
    respondWith(() => _body(200, _blobNotFoundXml));
    final other = newBloc();
    addTearDown(other.dispose);

    await other.load(_url);
    await bloc.load(_url);

    expect(adapter.requests, 1);
  });

  test('load: URL already loaded → emits it synchronously', () async {
    respondWith(() => _body(200, _svg));
    final other = newBloc();
    addTearDown(other.dispose);
    await other.load(_url);

    unawaited(bloc.load(_url));

    // available before any await, so the widget's first frame draws it
    expect(bloc.svgStream.valueOrNull, _svg);
  });

  test('load: URL that already failed → emits null synchronously', () async {
    respondWith(() => _body(404, _blobNotFoundXml));
    final other = newBloc();
    addTearDown(other.dispose);
    await other.load(_url);

    unawaited(bloc.load(_url));

    // known before any await, so the widget shows errorWidget, not placeholder
    expect(bloc.svgStream.hasValue, isTrue);
  });

  test('load: bloc disposed mid-download → completes without error', () async {
    final download = Completer<ResponseBody>();
    respondWith(() => download.future);
    final load = bloc.load(_url);

    bloc.dispose();
    download.complete(ResponseBody.fromString(_svg, 200));

    await expectLater(load, completes);
  });
}
