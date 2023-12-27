
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
///// put it in routes 
///  import '../../modules/{{featureName.snakeCase()}}/presentation/{{featureName.pascalCase()}}.dart';
/// static const String {{featureName.pascalCase()}}Screen = "{{featureName.pascalCase()}}Screen";
//  case Routes.{{featureName.pascalCase()}}Screen:
        // return CupertinoPageRoute(
        //     settings: routeSettings,
        //     builder: (_) {
        //       return const {{featureName.pascalCase()}}Screen();
        //     });
class {{featureName.pascalCase()}}Screen extends StatefulWidget {
  const {{featureName.pascalCase()}}Screen({Key? key}) : super(key: key);

  @override
  State<{{featureName.pascalCase()}}Screen> createState() => _{{featureName.pascalCase()}}ScreenState();
}

class _{{featureName.pascalCase()}}ScreenState extends State<{{featureName.pascalCase()}}Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>  {{featureName.pascalCase()}}Cubit(),
    child:  BlocConsumer<{{featureName.pascalCase()}}Cubit, {{featureName.pascalCase()}}States>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = {{featureName.pascalCase()}}Cubit.get(context);
          return child:Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text("${{featureName.pascalCase()}}Screen"),
      
                  
                ],
              ),
            ),
            );
        },
      ),);
    
  }
}
