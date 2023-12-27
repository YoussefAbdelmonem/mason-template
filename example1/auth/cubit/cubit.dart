import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/data_source/dio_helper.dart';
import '../../core/utiles/Locator.dart';
import '../domain/repository/repository.dart';
import 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  
 AuthRepository authRepository =  AuthRepository(locator<DioService>());
}