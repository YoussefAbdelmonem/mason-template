import 'endpoints.dart';

import '../model/auth_model.dart';
import '../../../../core/data_source/dio_helper.dart';

  //put it in locators locator.registerLazySingleton(() => authRepository(locator<DioService>()));
//  import '../../modules/auth/domain/repository/repository.dart';
class AuthRepository{
final  DioService dioService ;
  AuthRepository(this.dioService);
}
