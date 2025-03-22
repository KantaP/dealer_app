import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewModel extends CustomViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  Future<void> call() async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '+66661101109',
    );
    launchUrl(uri);
  }

  Future<void> email() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'support@1109x.com',
    );
    launchUrl(uri);
  }

  Future<void> line() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'support@1109x.com',
    );
    launchUrl(uri);
  }

  Future<void> openWeb() async {
    final Uri uri = Uri(
      scheme: 'https',
      path: 'https://www.1109x.net',
    );
    launchUrl(uri);
  }
}
