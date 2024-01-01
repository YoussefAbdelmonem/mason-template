
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
///// put it in routes 
///  import '../../modules/home/presentation/Home.dart';
/// static const String HomeScreen = "HomeScreen";
//  case Routes.HomeScreen:
        // return CupertinoPageRoute(
        //     settings: routeSettings,
        //     builder: (_) {
        //       return const HomeScreen();
        //     });
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>  HomeCubit(),
    child:  BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text("HomeScreen"),
      
                  
                ],
              ),
            ),
            );
        },
      ),);
    
  }
}
