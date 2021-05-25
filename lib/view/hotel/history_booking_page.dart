import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/utils/utilities.dart';
import 'package:animation/view/hotel/history_detai_page.dart';
import 'package:animation/view/hotel/hotel_detail_page.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/circle_avatar.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:flutter/material.dart';

class HistoryBookingPage extends StatefulWidget {

  @override
  _HistoryBookingPageState createState() => _HistoryBookingPageState();
}

class _HistoryBookingPageState extends State<HistoryBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appbarDefault(context, "Lịch sử đặt lịch",bgColor: ColorUtils.underlined),
       backgroundColor: ColorUtils.underlined,
      body: Container(
        margin: EdgeInsets.only(left: setWidth(8), bottom: setHeight(18),top: setHeight(8), right: setWidth(8)),
        padding: EdgeInsets.only(right: setWidth(16), left: setWidth(16)),
        decoration: BoxDecoration(
            color: ColorUtils.WHITE_TEXT,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorUtils.gray5)
        ),
        child: ListView.builder(
            itemCount: listHistory.length,
            itemBuilder: (context, index){
              var item = listHistory[index];
          return GestureDetector(
            onTap: (){
              pushAnimatin(context,HistoryDetaiPage(historyHotel: item,));
            },
            child: Container(
              margin: EdgeInsets.only(left: setWidth(8), right: setWidth(8), top: setHeight(16)),
              padding: EdgeInsets.only(bottom: setHeight(4)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorUtils.gray5
                  )
                )
              ),
              child: Row(
                children: [
                  CircleAvatar(radius: 30),
                  SizedBox(width: setWidth(8)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name??"", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.NUMBER_PAGE)),
                      Text(item.dateStr??"", style: FontUtils.MEDIUM,),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Image.asset(getAssetsIcon(item.urlRoom), height: setHeight(25)),
                      Text(item.nameRoom, style: FontUtils.NORMAL.copyWith(color: ColorUtils.NUMBER_PAGE, fontSize: setSp(12))),
                      Container(
                        padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.MAIN_GRADIENT_1
                          ),
                          child: Text(item.moneyRoom, style: FontUtils.NORMAL.copyWith(color: ColorUtils.WHITE_TEXT),))
                    ],
                  )
                  ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
