class OMAdvice {
  final String title;
  final String content;
  final OMAdviceCategory category;

  OMAdvice({
    required this.title,
    required this.content,
    required this.category,
  });
}

enum OMAdviceCategory {
  priprema,
  tijekom,
  njega,
  pravila,
  ;

  String get title {
    switch (this) {
      case priprema:
        return "Prije tetoviranja";
      case tijekom:
        return "Tijekom tetoviranja";
      case njega:
        return "Njega tetovaža";
      case pravila:
        return "Pravila salona";
    }
  }
}
