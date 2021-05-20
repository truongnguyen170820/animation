
import 'package:animation/utils/screen/screen_utils.dart';
import 'package:animation/widget/animation_pushto.dart';
import 'package:flutter/material.dart';


class Global {
}
setHeight(num value) {
  return ScreenUtil().setHeight(value);
}

setWidth(num value) {
  return ScreenUtil().setWidth(value);
}

setSp(num value) {
  return ScreenUtil().setSp(value);
}

String getAssetsIcon(String icon){
  return "assets/icons/" + icon;
}

String getAssetsImage(String image){
  return "assets/images/" + image;
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
String timeExercise(int time) {
  return (time ~/ 60>9?'${time ~/ 60}': '0${time ~/ 60}')+':'+((time % 60)<10?'0${time % 60}':'${time % 60}');
}
 pushTo(BuildContext context,Widget widget,{bool isReturn=false} )async{
   dynamic result;
  if(isReturn)result=await Navigator.push(context, SlideRightRoute(page: widget,),);
  else result = Navigator.push(context, SlideRightRoute(page: widget,),);
 return  result;
}

void pushToAndRemove(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
void pushReplacementWidget(BuildContext context, Widget widget,{String routeName = ""}) {
  if(routeName.isEmpty) routeName = widget.toString();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => widget,
    settings: RouteSettings(name: routeName,),));
}
void pop(BuildContext context, {dynamic result}) {
  Navigator.pop(
    context,
    result,
  );}

  void pushAnimatin(BuildContext context, Widget widget, {String routeName = ""}){
    if(routeName.isEmpty) routeName = widget.toString();
    Navigator.push(context, PageRouteBuilder(
      settings: RouteSettings(name: routeName),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, Animation<double> animation,
            Animation<double> secAnimation, Widget chidl){
          return ScaleTransition(scale: animation, child: chidl);
        },
        pageBuilder: (context, Animation<double> animation,
            Animation<double> secAnimation){
          return widget;
        }
    ));
  }