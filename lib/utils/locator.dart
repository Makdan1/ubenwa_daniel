
import 'package:ubenwa_daniel/core/services/activities_service.dart';
import 'package:get_it/get_it.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_service.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => Activities());
  // locator.registerLazySingleton(() => Activities());

}
