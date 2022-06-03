import 'package:get_it/get_it.dart';
import 'package:handova/core/services/authentication_service.dart';
import 'package:handova/core/services/navigation_service.dart';
import 'package:handova/core/view_models/auth_view_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());

  // // API Services
  locator.registerLazySingleton(() => AuthenticationService());

  // View Models
  locator.registerLazySingleton(() => AuthViewModel());
}
