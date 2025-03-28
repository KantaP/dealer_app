import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/di/components/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const development = 'development';
  static const production = 'production';
  static const stagging = 'stagging';
  static const test = 'test';
}
