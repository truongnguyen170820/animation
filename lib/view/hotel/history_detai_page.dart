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
            SizedBox(height: setHeight(40)),
            CircleAvatar(radius: 40),
            _buildCustomer("Tên khách hàng", widget.historyHotel.name??""),
            _buildCustomer("Ngày sinh", widget.historyHotel.brithday??""),
            _buildCustomer("Số điện thoại", widget.historyHotel.mobile??""),
            _buildCustomer("Địa chỉ", widget.historyHotel.address??""),
            Container(
              margin: EdgeInsets.only(top: setHeight(8)),
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
  Widget _buildCustomer(String name, String intro){
    return Container(
     padding: EdgeInsets.only(top: setHeight(8), bottom: setHeight(8)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorUtils.underlined
          )
        )
      ),
      child: Row(
        children: [
          Text(name, style: FontUtils.MEDIUM.copyWith(color: ColorUtils.NUMBER_PAGE),),
          Spacer(),
          Container(
              width: setWidth(200),
              child: Text(intro, style: FontUtils.NORMAL.copyWith(color: ColorUtils.gray2),maxLines: 2,textAlign: TextAlign.end,))
        ],
      ),
    );
  }
}
