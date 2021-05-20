import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/widget/circle_avatar.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EffectView extends StatefulWidget {
  @override
  _EffectViewState createState() => _EffectViewState();
}

class _EffectViewState extends State<EffectView> {

  double percent = 0;
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorUtils.text_selected,
                  ColorUtils.colorTextLogo
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          ),
          SafeArea(child: Container(
            child: Column(
              children: [
                DrawerHeader(child:
                CircleAvatar()
                ),
                Expanded(child: Column(
                  children: [
                    Text("123"),
                    Text("123"),
                    Text("123"),
                  ],
                ))
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(microseconds: 500),
              curve: Curves.easeIn,
              builder: (_,double val,__){
                return(
                Transform(
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi/6) * val),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("huhu"),),
                    body: Column(
                      children: [
                        SizedBox(height: setHeight(100)),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: setHeight(5),
                          restartAnimation: false,
                          percent: 2/5,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          clipLinearGradient: true,
                          linearGradient: ColorUtils.APPBAR_GRADIENT,
                        ),
                        SizedBox(height: setHeight(10)),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Agne'
                          ),
                          child: AnimatedTextKit(
                              animatedTexts: [
                            // RotateAnimatedText('AWESOME',),
                            // RotateAnimatedText('OPTIMISTIC'),
                            // RotateAnimatedText('DIFFERENT'),
                            // //
                            // FadeAnimatedText('do IT!'),
                            // FadeAnimatedText('do it RIGHT!!'),
                            // FadeAnimatedText('do it RIGHT NOW!!!'),
                            // //
                            // TyperAnimatedText('It is not enough to do your best,'),
                            // TyperAnimatedText('you must know what to do,'),
                            // TyperAnimatedText('and then do your best'),
                            // TyperAnimatedText('- W.Edwards Deming'),
                            //
                            // //
                            // TypewriterAnimatedText('Discipline is the best tool'),
                            // TypewriterAnimatedText('Design first, then code'),
                            // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                            // TypewriterAnimatedText('Do not test bugs out, design them out'),
                            // //

                            ColorizeAnimatedText(
                              'Larry Page',
                              colors: colorizeColors,
                              textStyle:  TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne'
                              ),
                            ),
                            ColorizeAnimatedText(
                              'Bill Gates',
                              colors: colorizeColors,
                              textStyle:  TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne'
                              ),
                            ),
                            ColorizeAnimatedText(
                              'Steve Jobs',
                              colors: colorizeColors,
                              textStyle:  TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne'
                              ),
                            ),

                          ],
                            isRepeatingAnimation: true,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e){
              if(e.delta.dx > 0){
                setState(() {
                  value = 1;
                });
              }else{
                setState(() {
                  value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
}
