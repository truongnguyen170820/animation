import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:flutter/material.dart';

class HistoryDetaiPage extends StatefulWidget {
  final HistoryHotel historyHotel;


  const HistoryDetaiPage({Key key, this.historyHotel,}) : super(key: key);
  @override
  _HistoryDetaiPageState createState() => _HistoryDetaiPageState();
}

class _HistoryDetaiPageState extends State<HistoryDetaiPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Thông tin đặt lịch", bgColor: ColorUtils.underlined),
      backgroundColor: ColorUtils.underlined,
      body: Container(
        margin: EdgeInsets.only(left: setWidth(8), bottom: setHeight(18),top: setHeight(8), right: setWidth(8)),
        padding: EdgeInsets.only(right: setWidth(16), left: setWidth(16)),
        decoration: BoxDecoration(
            color: ColorUtils.WHITE_TEXT,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorUtils.gray5)
        ),
        child: Column(
          children: [
            CircleAvatar(radius: 40),
            Text(widget.historyHotel.name??"", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.NUMBER_PAGE)),
            Text(widget.historyHotel.brithday??""),
            Text(widget.historyHotel.mobile??""),
            Text(widget.historyHotel.address??""),
            Text(widget.historyHotel.nameRoom??""),
            Container(
              padding: EdgeInsets.only(left: setWidth(8), top: setHeight(8), right: setWidth(8), bottom: setHeight(8)),
              decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.blueAccent),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Image.asset(getAssetsIcon(widget.historyHotel.urlRoom??""), height: setHeight(60),),
                  SizedBox(width: setWidth(8)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text("Tên khách sạn: "),
                           // Text(widget.nameHotel.nameHote??""),
                         ],
                       ),
                      Row(
                        children: [
                          Text("Phòng: ", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.blueAccent, fontSize: setSp(16)),),
                          Text(widget.historyHotel.nameRoom, style: FontUtils.NORMAL.copyWith(fontSize: setSp(13), color: ColorUtils.NUMBER_PAGE),),
                         SizedBox(width: setWidth(20)),
                          Text("Giá phòng: ", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.blueAccent, fontSize: setSp(16))),
                          Text(widget.historyHotel.moneyRoom,  style: FontUtils.NORMAL.copyWith(fontSize: setSp(13), color: ColorUtils.NUMBER_PAGE)),
                          Icon(
                            Icons.attach_money_outlined,
                            size: setSp(14),
                            color: ColorUtils.YELLOW_TEXT,
                          ),
                        ],
                      )
                     ],
                  ),


                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
