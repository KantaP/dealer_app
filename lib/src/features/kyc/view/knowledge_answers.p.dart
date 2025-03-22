import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class KnowledgeAnswersScreen extends StatelessWidget {
  const KnowledgeAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(slivers: [], physics: BouncingScrollPhysics());
  }
}
