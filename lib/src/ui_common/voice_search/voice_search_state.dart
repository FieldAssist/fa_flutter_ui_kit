enum VoiceSpeechState { listening, failed }

class VoiceSearchState {
  const VoiceSearchState({
    this.speechState = VoiceSpeechState.listening,
    this.recognizedText = '',
  });

  final VoiceSpeechState speechState;
  final String recognizedText;

  VoiceSearchState copyWith({
    VoiceSpeechState? speechState,
    String? recognizedText,
  }) {
    return VoiceSearchState(
      speechState: speechState ?? this.speechState,
      recognizedText: recognizedText ?? this.recognizedText,
    );
  }
}
