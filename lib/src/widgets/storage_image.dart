import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';

class StorageImage extends StatefulWidget {
  final String storagePath;
  final String fileName;

  const StorageImage(
      {super.key, required this.storagePath, required this.fileName});

  @override
  State<StorageImage> createState() =>
      _StorageImageState(getIt<FirebaseClient>());
}

class _StorageImageState extends State<StorageImage> {
  String netWorkUrl = '';
  late FirebaseClient _firebaseClient;

  _StorageImageState(FirebaseClient firebaseClient) {
    _firebaseClient = firebaseClient;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (netWorkUrl == '') return Container();
    // return Image.network(
    //   netWorkUrl,
    //   width: 40,
    //   height: 40,
    // );
    return CustomFuture(
      future: getImagePath(),
      customLoading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
      builder: (_, snapshot) => Image.network(
        snapshot.data!,
        fit: BoxFit.fill,
        width: 40,
        height: 40,
      ),
    );
  }

  Future<String> getImagePath() async {
    String path = '';
    try {
      path = await _firebaseClient.getStaticFile(
          widget.storagePath, widget.fileName);
    } catch (e) {
      path =
          await _firebaseClient.getStaticFile(widget.storagePath, 'not_found');
    }
    return path;
    // setState(() {
    //   netWorkUrl = path;
    // });
  }
}
