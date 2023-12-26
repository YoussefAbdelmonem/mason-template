import 'package:flutter/material.dart';

import '../data_source/hive_helper.dart';
import 'Locator.dart';
import 'validations.dart';

class Utils {

  static String token = '';
  static String lang = '';
  static String FCMToken = '';
  static String userType = "";
  // static UserModel userModel = UserModel();
  static GlobalKey<NavigatorState> navigatorKey() =>
      locator<GlobalKey<NavigatorState>>();
  static GlobalKey<NavigatorState> app1Nav = GlobalKey();
  static GlobalKey<NavigatorState> app2Nav = GlobalKey();
  static Validation get valid => locator<Validation>();
  static DataManager get dataManager => locator<DataManager>();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static saveUserInHive(Map<String, dynamic> response) async {
    // userModel = UserModel.fromJson(response);
    // token = userModel.token ?? '';
    // await Utils.dataManager.saveUser(Map<String, dynamic>.from(response));
  }



  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}

extension MySLiverBox on Widget {
  // SliverToBoxAdapter get SliverBox => SliverToBoxAdapter(
  //   child: this,
  // );
  /*  SliverToBoxAdapter get SliverBoxAnimation => SliverToBoxAdapter(
    child: Padding(
      padding:  EdgeInsets.all(16),
      child: this,
    ),
  ); */
}
