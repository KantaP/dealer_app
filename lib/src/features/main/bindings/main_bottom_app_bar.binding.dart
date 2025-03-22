import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';

import '../view/di/order_menu_modal.vm.dart';

class MainBottomAppBarBinding {
  static MainViewModel get mainBottomAppBarViewModel => getIt<MainViewModel>();
  static OrderMenuModalViewModel get orderMenuModalViewModel =>
      getIt<OrderMenuModalViewModel>();
}
