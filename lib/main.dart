import 'package:animation/getX/view/product_view.dart';
import 'package:animation/utils/screen/screen_utils.dart';
import 'package:animation/view/Main.dart';
import 'package:animation/view/splash_screen/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (BuildContext context, Widget child) {
          final data = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
          ScreenUtil.init(context, width:375, height: 667, allowFontScaling: true);
          return MediaQuery(data: data, child: child);},
      home: ProductListView(),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   builder: (BuildContext context, Widget child) {
    //     final data = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
    //     ScreenUtil.init(context, width:375, height: 667, allowFontScaling: true);
    //     return MediaQuery(data: data, child: child);
    //   },
    //   home: SplashScreen(),
    // );
  }
}
