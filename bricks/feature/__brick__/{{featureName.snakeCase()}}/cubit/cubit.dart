import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/data_source/dio_helper.dart';
import '../../core/utiles/Locator.dart';
import '../domain/repository/repository.dart';
import 'states.dart';

class {{featureName.pascalCase()}}Cubit extends Cubit<{{featureName.pascalCase()}}States> {
  {{featureName.pascalCase()}}Cubit() : super({{featureName.pascalCase()}}Initial());
  static {{featureName.pascalCase()}}Cubit get(context) => BlocProvider.of(context);
  
 {{featureName.pascalCase()}}Repository {{featureName.snakeCase()}}Repository =  {{featureName.pascalCase()}}Repository(locator<DioService>());
}