import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data_source/dio_helper.dart';
import '../../../core/utiles/Locator.dart';
import '../domain/repository/repository.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  
 HomeRepository homeRepository =  HomeRepository(locator<DioService>());
}