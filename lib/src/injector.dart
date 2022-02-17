
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:poke_app/src/data/repositories/app_repository_impl.dart';
import 'package:poke_app/src/domain/repositories/app_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  
  //SharedPreferences
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  final packageInfo = await PackageInfo.fromPlatform();
  injector.registerLazySingleton(() => packageInfo);

 
  // Repositories
  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(injector()),
  );
 
}
