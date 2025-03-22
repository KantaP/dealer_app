import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class BankNdidExpansionModel implements Model<BankNdidExpansionModel> {
  int _index = 0;
  bool _isExpanded = false;

  BankNdidExpansionModel({int index = 0, bool isExpanded = false}) {
    _index = index;
    _isExpanded = isExpanded;
  }

  int get index => _index;
  bool get isExpanded => _isExpanded;

  @override
  BankNdidExpansionModel copyWith(Map<String, dynamic> value) {
    return BankNdidExpansionModel(
      index: value[BankNdidExpansionModelFields.index] ?? _index,
      isExpanded: value[BankNdidExpansionModelFields.isExpanded] ?? _isExpanded,
    );
  }
}

class BankNdidExpansionModelFields {
  BankNdidExpansionModelFields._();
  static const String index = 'index';
  static const String isExpanded = 'isExpanded';
}

class BankNdidPageState implements IPageState<BankNdidPageState> {
  List<IdpModel> _ndidBankRegister = [];
  List<IdpModel> _ndidBankUnregister = [];

  String _selectedIdItem = '';

  List<BankNdidExpansionModel> _expansionItems = [];

  BankNdidPageState({
    List<IdpModel> ndidBankRegister = const [],
    List<IdpModel> ndidBankUnregister = const [],
    String selectedIdItem = '',
    List<BankNdidExpansionModel> expansionItems = const [],
  }) {
    _ndidBankRegister = ndidBankRegister;
    _ndidBankUnregister = ndidBankUnregister;
    _selectedIdItem = selectedIdItem;
    _expansionItems = expansionItems;
  }

  List<IdpModel> get ndidBankRegister => _ndidBankRegister;
  List<IdpModel> get ndidBankUnRegister => _ndidBankUnregister;
  String get selectedIdItem => _selectedIdItem;
  List<BankNdidExpansionModel> get expansionItems => _expansionItems;

  @override
  BankNdidPageState copyWith(Map<String, dynamic> value) {
    return BankNdidPageState(
      ndidBankRegister:
          value[BankNdidPageStateFields.ndidBankRegister] ?? _ndidBankRegister,
      ndidBankUnregister: value[BankNdidPageStateFields.ndidBankUnRegister] ??
          _ndidBankUnregister,
      selectedIdItem:
          value[BankNdidPageStateFields.selectedIdItem] ?? _selectedIdItem,
      expansionItems:
          value[BankNdidPageStateFields.expansionItems] ?? _expansionItems,
    );
  }
}

class BankNdidPageStateFields {
  BankNdidPageStateFields._();

  static const String ndidBankRegister = 'ndidBankRegister';
  static const String ndidBankUnRegister = 'ndidBankUnRegister';
  static const String selectedIdItem = 'selectedIdItem';
  static const String expansionItems = 'expansionItems';
}
