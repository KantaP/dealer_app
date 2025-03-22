class CustomFirebaseException<T> {
  String? message;
  String? code;

  CustomFirebaseException({this.message, this.code});

  void captureException() {
    // //Sentry.captureException(code);
    // DialogUtils.showToast(
    //     msg: message ?? S.current.somethingWentWrong, type: 'error');
  }
}
