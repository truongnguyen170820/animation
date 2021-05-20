import 'dart:async';

import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/utils/screen/screen_utils.dart';
import 'package:animation/view/Main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, router);
  }
  router(){
    pushTo(context, MainView());
    // Navigator.push(context, MaterialPageRoute(builder: (context) =>MainView()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: 667, width: 375, allowFontScaling: true);
    return Scaffold(
     body: Container(
       color: ColorUtils.text_selected,
     ),
    );
  }
}
