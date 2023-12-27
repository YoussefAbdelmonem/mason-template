import 'endpoints.dart';

import '../model/{{featureName.camelCase()}}_model.dart';
import '../../../../core/data_source/dio_helper.dart';

  //put it in locators locator.registerLazySingleton(() => {{featureName.pascalCase()}}Repository(locator<DioService>()));
//  import '../../modules/{{featureName.snakeCase()}}/domain/repository/repository.dart';
class {{featureName.pascalCase()}}Repository{
final  DioService dioService ;
  {{featureName.pascalCase()}}Repository(this.dioService);
}
