import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/view/effect_view.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:animation/widget/custombutton.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.WHITE_TEXT,
      appBar: appbarDefault(
          context, "Test Animation", bgColor: ColorUtils.WHITE_TEXT),
      body: Column(
        children: [
          ButtonCustom(
            title: "Animation",
            onTap: () {
              pushTo(context, EffectView());
            },
          ),
          SizedBox(height: setHeight(10)),
          ButtonCustom(
            title: "room",
            onTap: () {
              pushAnimatin(context, EffectView());
            },
          ),
          SizedBox(height: setHeight(10)),
          ButtonCustom(
            title: "view",
            onTap: () {
              pushTo(context, HotelPage());
            },
          )
        ],
      ),
    );
  }
}
