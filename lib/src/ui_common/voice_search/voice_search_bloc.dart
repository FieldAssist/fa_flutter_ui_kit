import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'speech_status.dart';
import 'voice_search_state.dart';

class VoiceSearchBloc {
  VoiceSearchBloc({required this.onResult});

  final ValueChanged<String> onResult;

  final _stateSubject =
      BehaviorSubject<VoiceSearchState>.seeded(const VoiceSearchState());

  ValueStream<VoiceSearchState> get stateStream => _stateSubject.stream;

  final _stt = stt.SpeechToText();

  static const _listenFor = Duration(seconds: 30);

  bool _listenStarted = false;
  bool _handled = false;
  Timer? _safetyTimer;
  Timer? _watchdogTimer;

  void _cancelTimers() {
    _safetyTimer?.cancel();
    _safetyTimer = null;
    _watchdogTimer?.cancel();
    _watchdogTimer = null;
  }

  void _showFailed() {
    _cancelTimers();
    if (_handled) {
      return;
    }
    _handled = true;
    unawaited(_stt.cancel());
    _stateSubject.addDataSafely(
      _stateSubject.value.copyWith(speechState: VoiceSpeechState.failed),
    );
  }

  void _deliver(String text) {
    _cancelTimers();
    if (_handled) {
      return;
    }
    _handled = true;
    onResult(text);
  }

  // ignore: avoid_dynamic_calls
  void _onError(SpeechRecognitionError error) {
    if (_handled) {
      return;
    }
    final text = _stateSubject.value.recognizedText;
    if (text.isNotEmpty) {
      _deliver(text);
    } else {
      _showFailed();
    }
  }

  void _onStatus(String status) {
    if (_handled) {
      return;
    }

    final parsed = SpeechStatus.fromString(status);
    final isDone = parsed == SpeechStatus.done;
    final isNotListening =
        parsed == SpeechStatus.notListening && _listenStarted;
    if (!isDone && !isNotListening) {
      return;
    }

    _watchdogTimer?.cancel();
    _watchdogTimer = null;

    if (_safetyTimer != null) {
      return;
    }

    // On Android, finalResult may arrive up to ~300 ms after 'done'.
    // Wait 500 ms before deciding.
    _safetyTimer = Timer(const Duration(milliseconds: 500), () {
      if (_handled) {
        return;
      }
      final text = _stateSubject.value.recognizedText;
      if (text.isNotEmpty) {
        _deliver(text);
      } else {
        _showFailed();
      }
    });
  }

  Future<void> startListening() async {
    _handled = false;
    _listenStarted = false;
    _cancelTimers();
    _stateSubject.addDataSafely(const VoiceSearchState());

    final available = await _stt.initialize(
      onStatus: _onStatus,
      onError: _onError,
    );
    if (!available) {
      _stateSubject.addDataSafely(
        _stateSubject.value.copyWith(
          speechState: VoiceSpeechState.failed,
        ),
      );
      return;
    }

    // Watchdog: only a backstop for a recogniser that never reports a terminal event.
    _watchdogTimer = Timer(_listenFor + const Duration(seconds: 5), _showFailed);
    _listenStarted = true;

    unawaited(
      _stt.listen(
        pauseFor: const Duration(seconds: 3),
        listenFor: _listenFor,
        onResult: (result) {
          if (_handled) {
            return;
          }
          _stateSubject.addDataSafely(
            _stateSubject.value.copyWith(
              recognizedText: result.recognizedWords,
            ),
          );
          if (result.finalResult) {
            final text = _stateSubject.value.recognizedText;
            if (text.isNotEmpty) {
              _deliver(text);
            } else {
              _showFailed();
            }
          }
        },
      ),
    );
  }

  Future<void> cancelSpeech() async {
    _cancelTimers();
    await _stt.cancel();
  }

  void dispose() {
    _cancelTimers();
    _stt.cancel();
    _stateSubject.close();
  }
}
