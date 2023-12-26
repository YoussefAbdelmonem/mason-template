import 'package:get_it/get_it.dart';

import '../data_source/dio_helper.dart';
import '../data_source/hive_helper.dart';



GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DataManager());
  locator.registerLazySingleton(() => DioService());

}