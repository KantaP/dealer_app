import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';

class StorageImageAuth extends StatefulWidget {
  final String storagePath;
  final String fileName;

  const StorageImageAuth(
      {super.key, required this.storagePath, required this.fileName});

  @override
  State<StorageImageAuth> createState() =>
      _StorageImageAuthState(getIt<FirebaseClient>());
}

class _StorageImageAuthState extends State<StorageImageAuth> {
  String netWorkUrl = '';
  late FirebaseClient _firebaseClient;

  _StorageImageAuthState(FirebaseClient firebaseClient) {
    _firebaseClient = firebaseClient;
  }

  @override
  void initState() {
    super.initState();
    getImagePath();
  }

  @override
  Widget build(BuildContext context) {
    if (netWorkUrl == '') return Container();
    return Image.network(
      netWorkUrl,
    );
  }

  Future<void> getImagePath() async {
    String path = '';
    try {
      path = await _firebaseClient.getStaticFileWithUserId(
          widget.storagePath, widget.fileName);
    } catch (e) {
      path =
          await _firebaseClient.getStaticFile(widget.storagePath, 'not_found');
    }

    setState(() {
      netWorkUrl = path;
    });
  }
}
