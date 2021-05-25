import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/utils/utilities.dart';
import 'package:animation/view/hotel/hotel_detail_page.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:animation/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

class AppointmentHotelPage extends StatefulWidget {
  final NameHotel nameHotel;

  const AppointmentHotelPage({Key key, this.nameHotel}) : super(key: key);
  @override
  _AppointmentHotelPageeState createState() => _AppointmentHotelPageeState();
}

class _AppointmentHotelPageeState extends State<AppointmentHotelPage> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _birthCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _roomCtrl = TextEditingController();
  TextEditingController _txtSearchAddress = TextEditingController();
  DateTime selectedDay;
int selectedVipIndex = 0;
int selectedDayIndex = 0;
  List<DateTime> listDays = [];
  int hourIndex;
  int minuteIndex;
  int employeeSelectedIndex = -1;
  String selectedEmployeeIdStr;
  int type;
  String provinceIdStr;
  String districtIdStr;
  String communeIdStr;

  @override
  void initState() {
    for (int i = 0; i <= 6; i++) {
      listDays.add(DateTime.now().add(Duration(days: i)));
    }
    hourIndex = DateTime.now().hour - 8;
    minuteIndex =
        double.parse((DateTime.now().minute / 10).toString()).round() + 1;
    if (minuteIndex > 5) {
      hourIndex += 1;
      minuteIndex = 0;
    }
    selectedDay = listDays[0];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Đặt Phòng", bgColor: ColorUtils.underlined),
      backgroundColor: ColorUtils.underlined,
      body: Container(
        margin: EdgeInsets.only(left: setWidth(8), bottom: setHeight(18),top: setHeight(8), right: setWidth(8)),
        padding: EdgeInsets.only(right: setWidth(16), left: setWidth(16)),
        decoration: BoxDecoration(
          color: ColorUtils.WHITE_TEXT,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorUtils.gray5)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAdd(_nameCtrl, "Nhận họ tên", "Họ tên"),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  _buildAdd(_birthCtrl, "Nhập ngày sinh", "Ngày sinh"),
                  Positioned(
                    right: setWidth(14),
                    bottom: setHeight(25),
                    child: InkWell(
                      onTap: (){
                        _selectDate(context, _birthCtrl);
                      },
                      child: Image.asset(getAssetsIcon("datebirth.png"), height: setHeight(19),),
                    ),
                  ),
                ],
              ),
              _buildAdd(_mobileCtrl, "Nhập số điện thoại", "Số điện thoại"),
              Text(
                "Chọn Tỉnh, Huyện, Xã",
                style: FontUtils.MEDIUM,
              ),
              Container(
                margin:
                EdgeInsets.only(top: setHeight(5), bottom: setHeight(10)),
                child: TypeAheadField(
                  noItemsFoundBuilder: (context) {
                    return Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Không tìm thấy kết quả",
                          style: FontUtils.MEDIUM,
                        ));
                  },
                  direction: AxisDirection.up,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _txtSearchAddress,
                    style:  FontUtils.MEDIUM,
                    maxLines: null,
                    maxLength: null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: setWidth(8),
                          bottom: setHeight(12),
                          top: setHeight(12),
                          right: setWidth(8)),
                      isDense: true,
                      hintText: 'Tìm tỉnh, huyện, xã',
                      hintStyle: FontUtils.MEDIUM,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return listAddress;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.Name,
                          style: FontUtils.MEDIUM
                              .copyWith(fontWeight: FontWeight.normal)),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _txtSearchAddress.text = suggestion.Name;
                    provinceIdStr = suggestion.provinceName;
                    districtIdStr = suggestion.districtName;
                    communeIdStr = suggestion.communeName;
                  },
                ),
              ),
              _buildAdd(_roomCtrl, "Nhập khách sạn", "Khách sạn"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chọn ngày',
                      style: FontUtils.MEDIUM
                          .copyWith(color: ColorUtils.TEXT_LIGHT)),
                  Text(
                    getWeekDay(selectedDay) +
                        "-" +
                        Utilities.dateToString(selectedDay),
                    style: FontUtils.MEDIUM,
                  ),
                ],
              ),
              Container(
                  height: setHeight(55),
                  width: double.infinity,
                  margin:
                  EdgeInsets.only( top: setHeight(10), bottom: setHeight(16)),
                  child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildItemDay(index, listDays[index]);
                      })),
              Text(
                "Chọn thời gian checkin",
                style:
                FontUtils.MEDIUM.copyWith(color: ColorUtils.TEXT_LIGHT),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(8)),
                width: double.infinity,
                padding: EdgeInsets.only(left: setWidth(16)),
                height: setHeight(250),
                child: ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, hour) {
                      return _itemTime(hour);
                    }),
              ),
              Text(
                "Lựa chọn phòng",
                style:
                FontUtils.MEDIUM.copyWith(color: ColorUtils.TEXT_LIGHT),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(8), bottom: setHeight(16)),
                width: double.infinity,
                padding: EdgeInsets.only(left: setWidth(16)),
                height: setHeight(50),
                child: ListView.builder(
                    itemCount:  listRoom.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return  GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedVipIndex = index;
                          });
                        },
                        child: Stack(
                          children: [
                            Image.asset(getAssetsIcon(listRoom[index].url??""), width: setWidth(60),height: setHeight(60)),
                            selectedVipIndex == index ?
                            Positioned(
                                right: 0,
                                top: 0,
                                child:  Container(
                                    decoration: BoxDecoration(
                                        color: ColorUtils.WHITE_TEXT,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white)
                                    ),
                                    child: Image.asset(getAssetsIcon("tickRank.png"), width: setWidth(13),height: setHeight(13)))
                            )
                                : SizedBox(),
                          ],
                        ),
                      );
                    }),
              ),
              Center(
                child: ButtonCustom(
                  title: "Đặt lịch",
                  borderRadius: 12,
                  onTap: (){
                    check();
                  },
                  height: setHeight(42),
                  width: setWidth(200),
                  bgColor: ColorUtils.blueAccent,
                  textStyle: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT),
                ),
              ),
              SizedBox(height: setHeight(20))
            ],
          ),
        ),
      ),
    );
  }

  String getWeekDay(DateTime day) {
    switch (day.weekday) {
      case 1:
        {
          return "T2";
        }
        break;
      case 2:
        {
          return "T3";
        }
        break;
      case 3:
        {
          return "T4";
        }
        break;
      case 4:
        {
          return "T5";
        }
        break;
      case 5:
        {
          return "T6";
        }
        break;
      case 6:
        {
          return "T7";
        }
        break;
      default:
        return "CN";
    }
  }
  Widget _buildAdd(TextEditingController controller, String hintText, String name){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Text(name, style: FontUtils.NORMAL.copyWith(fontSize: setSp(12))),
        Container(
          height: setHeight(42),
          margin: EdgeInsets.only(top: setHeight(8), bottom: setHeight(15)),
          padding: EdgeInsets.only(left: setWidth(16), bottom: setHeight(8)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorUtils.blueAccent)
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: FontUtils.NORMAL.copyWith(color: ColorUtils.gray, fontSize: setSp(12))
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildItemDay(int index, DateTime dateTime) {
    const Color colorIsSelect = ColorUtils.icon_selected;
    const Color colorUnSelect = ColorUtils.backgroundGrayLight;
    const Color borderColor = ColorUtils.backgroundBorderLight;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDayIndex = index;
          selectedDay = dateTime;
        });
      },
      child: Container(
        height: setHeight(55),
        width: setWidth(50),
        margin: EdgeInsets.only(right: setWidth(7)),
        decoration: BoxDecoration(
            color: selectedDayIndex == index ? colorIsSelect : colorUnSelect,
            border: Border.all(
                color: selectedDayIndex == index ? colorIsSelect : borderColor),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getWeekDay(listDays[index]),
              style: FontUtils.MEDIUM.copyWith(
                  fontSize: setSp(12),
                  color: selectedDayIndex == index
                      ? Colors.white
                      : ColorUtils.TEXT_LIGHT),
            ),
            SizedBox(
              height: setHeight(3),
            ),
            Text(
              dateTime.day.toString(),
              style: FontUtils.MEDIUM.copyWith(
                  fontSize: setSp(16),
                  color: selectedDayIndex == index
                      ? Colors.white
                      : ColorUtils.TEXT_NORMAL),
            )
          ],
        ),
      ),
    );
  }
  Widget _itemTime(int hour) {
    DateTime timeNow = DateTime.now();
    return Column(
      children: List.generate(6, (min) {
        return GestureDetector(
          onTap: () {
            if (timeNow.isBefore(DateTime(selectedDay.year, selectedDay.month,
                selectedDay.day, hour + 8, min * 10))) {
              setState(() {
                hourIndex = hour;
                minuteIndex = min;
              });
            }
          },
          child: Container(
            height: setHeight(30),
            width: setWidth(80),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: setWidth(8), bottom: setHeight(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: (hourIndex == hour && minuteIndex == min)
                        ? ColorUtils.icon_selected
                        : ColorUtils.backgroundBorderLight),
                color: (timeNow.isAfter(DateTime(
                    selectedDay.year,
                    selectedDay.month,
                    selectedDay.day,
                    hour + 8,
                    min * 10)))
                    ? ColorUtils.gray1
                    : (hourIndex == hour && minuteIndex == min)
                    ? ColorUtils.icon_selected
                    : ColorUtils.backgroundGrayLight),
            child: Text(
              Utilities.formatTimeOfDay(
                  TimeOfDay(hour: hour + 8, minute: min * 10)),
              style: FontUtils.MEDIUM.copyWith(
                  color: (hourIndex == hour && minuteIndex == min)
                      ? Colors.white
                      : ColorUtils.TEXT_NORMAL),
            ),
          ),
        );
      }),
    );
  }
  check(){
    listHistory.add(HistoryHotel(_nameCtrl.text??"", _birthCtrl.text??"", _mobileCtrl.text??""
        , Utilities.formatTimeOfDay(TimeOfDay(hour: hourIndex + 8, minute: minuteIndex* 10))
            +" - "+Utilities.dateToString(selectedDay)
           , "", nameRoom: listRoom[selectedVipIndex].nameRoom, urlRoom: listRoom[selectedVipIndex].url,
        moneyRoom: listRoom[selectedVipIndex].moneyRoom,
 address: _txtSearchAddress.text??""));
  Navigator.pop(context);
  }
  Future<Null> _selectDate(BuildContext context, TextEditingController txtController) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2101));
    if (picked != null &&
        DateFormat('dd/MM/yyyy').format(picked) != txtController.text)
      setState(() {
        // selectedDate = picked;
        txtController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }
}


class Room{
  String nameRoom;
  String url;
  String moneyRoom;
  Room(this.nameRoom, this.url, this.moneyRoom);
}
List<Room> listRoom = [
  Room("Vip 1", "vip.png", "100"),
  Room("Vip 2", "vip.png", "80"),
  Room("Vip 3", "vip.png", "50"),
  Room("Thường1", "vip.png", "30"),
  Room("Thường2", "vip.png", "20"),
];
