import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KnowledgeResultPageState implements IPageState<KnowledgeResultPageState> {
  int _score = 0;

  KnowledgeResultPageState({int score = 0}) {
    _score = score;
  }

  int get score => _score;

  @override
  KnowledgeResultPageState copyWith(Map<String, dynamic> value) {
    return KnowledgeResultPageState(
      score: value[KnowledgeResultPageStateFields.score] ?? _score,
    );
  }
}

class KnowledgeResultPageStateFields {
  KnowledgeResultPageStateFields._();

  static const String score = 'score';
}
