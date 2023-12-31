import 'package:get_it/get_it.dart';

import '../data_source/dio_helper.dart';
import '../data_source/hive_helper.dart';
import '../../features/auth/domain/repository/auth_repository.dart';

import 'package:flutter/material.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DataManager());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => GlobalKey<ScaffoldState>());
  locator.registerLazySingleton(() => GlobalKey<NavigatorState>());
  locator.registerLazySingleton(() => AuthRepository(locator<DioService>()));


}
