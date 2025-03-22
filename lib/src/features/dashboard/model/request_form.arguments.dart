class RequestFormArgumentsScreen {
  final String formUrl;
  final String title;
  final bool kycRequired;

  RequestFormArgumentsScreen({
    required this.formUrl,
    required this.title,
    this.kycRequired = false,
  });
}
