import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import '../config/ui_common_colors.dart';
import '../config/ui_common_texts.dart';
import 'voice_search_bloc.dart';
import 'voice_search_state.dart';

class VoiceSearchSheet extends StatefulWidget {
  const VoiceSearchSheet({required this.onResult, super.key});
  final ValueChanged<String> onResult;

  @override
  State<VoiceSearchSheet> createState() => _VoiceSearchSheetState();
}

class _VoiceSearchSheetState extends State<VoiceSearchSheet> {
  late final VoiceSearchBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = VoiceSearchBloc(
      onResult: (text) {
        widget.onResult(text);
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
    );
    _bloc.startListening();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VoiceSearchState>(
      stream: _bloc.stateStream,
      initialData: _bloc.stateStream.value,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const VoiceSearchState();
        final isFailed = state.speechState == VoiceSpeechState.failed;

        final titleText = isFailed
            ? UiCommonTexts().kVoiceSearchFailed
            : state.recognizedText.isNotEmpty
                ? state.recognizedText
                : UiCommonTexts().kListening;

        final Widget micWidget;
        if (isFailed) {
          micWidget = Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: UiCommonColors.kGrey400,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mic_off,
              color: UiCommonColors.kWhite,
              size: 36,
            ),
          );
        } else {
          micWidget = Lottie.asset(
            'assets/ui_common/mic.json',
            package: 'fa_flutter_ui_kit',
            width: 160,
            height: 160,
            repeat: true,
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: UiCommonColors.kWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: UiCommonColors.kBlack26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.close_outlined, size: 24),
                onPressed: () async {
                  await _bloc.cancelSpeech();
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: UiCommonColors.kWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        titleText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: UiCommonColors.kBlack87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: isFailed ? _bloc.startListening : null,
                      child: micWidget,
                    ),
                    if (isFailed) ...[
                      const SizedBox(height: 8),
                      Text(
                        UiCommonTexts().kTapOnMicAndSpeakAgain,
                        style: const TextStyle(
                          fontSize: 14,
                          color: UiCommonColors.kGrey500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
