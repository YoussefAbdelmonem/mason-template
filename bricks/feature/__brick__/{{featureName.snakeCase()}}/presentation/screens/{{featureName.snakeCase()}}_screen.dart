import 'package:flutter/material.dart';

class  {{featureName.pascalCase()}}Screen extends StatelessWidget {
  const  {{featureName.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("${{featureName.pascalCase()}}Screen"),
            
          ],
        ),
      ),
    );
  }
}