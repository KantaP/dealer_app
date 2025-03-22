import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:flutter/material.dart';

class SelectBankItem extends StatelessWidget {
  const SelectBankItem(
      {super.key,
      required this.item,
      required this.selected,
      required this.onTap});

  final IdpModel item;
  final bool selected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return _buildBankItem(item, selected);
  }

  Widget _buildBankItem(IdpModel e, bool selected) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (selected) ? blueColor.withOpacity(0.1) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StorageImage(
                fileName: '${e.id}.png',
                storagePath: FirebaseStorageValue.idpIconsRef,
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  e.code,
                  style: paragraph1RegularStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
