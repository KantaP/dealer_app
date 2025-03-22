import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/model/network.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SelectNetworkViewModel extends ViewModel {
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  Future<List<NetworkModel>> loadNetwork() {
    return JsonData.loadNetwork();
  }
}
