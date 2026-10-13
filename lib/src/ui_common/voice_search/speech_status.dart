enum SpeechStatus {
  listening('listening'),
  notListening('notListening'),
  done('done');

  const SpeechStatus(this.value);
  final String value;

  static SpeechStatus? fromString(String status) {
    final normalized = status.trim().toLowerCase();
    for (final s in values) {
      if (s.value.toLowerCase() == normalized) {
        return s;
      }
    }
    return null;
  }
}
