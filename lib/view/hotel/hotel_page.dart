import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/utils/utilities.dart';
import 'package:animation/view/hotel/history_booking_page.dart';
import 'package:animation/view/hotel/hotel_detail_page.dart';
import 'package:animation/view/hotel/playground_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appointment_hotel_page.dart';
List<HistoryHotel> listHistory = [];
class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  // NumberFormat nf = NumberFormat("###,###,###", "en_US");
  int type;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Playground", bgColor: ColorUtils.underlined),
      backgroundColor: ColorUtils.underlined,
      body:_buidBody()
    );
  }
Widget _buidBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top Hotel", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.blueAccent, fontSize: setSp(16))),
        Container(
          margin: EdgeInsets.only(top: setHeight(5), bottom: setHeight(8)),
          height: setHeight(1),
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorUtils.gray6
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: setHeight(8)),
          height: setHeight(200),
          child: ListView.builder(
            itemCount: listNameHotel.length,
            itemBuilder: (context, index){
              return itemTabBarView(listNameHotel[index]);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                pushTo(context,AppointmentHotelPage() );
              },
              child: Container(
                margin: EdgeInsets.only(left: setWidth(30)),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorUtils.gray6)
                ),
                child: Column(
                  children: [
                    Image.asset(getAssetsIcon("mobile.png"), height: setHeight(50), color: ColorUtils.blueAccent),
                    Text("Booking Room")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                pushTo(context, HistoryBookingPage());
              },
              child: Container(
                margin: EdgeInsets.only(left: setWidth(30)),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorUtils.gray6)
                ),
                child: Column(
                  children: [
                    Image.asset(getAssetsIcon("calendar.png"),  height: setHeight(50),color: ColorUtils.blueAccent,),
                    Text("History Booking")
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: setHeight(16)),
        Text("PlayGround", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.blueAccent, fontSize: setSp(16))),
        Container(
          margin: EdgeInsets.only(top: setHeight(5), bottom: setHeight(8)),
          height: setHeight(1),
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorUtils.gray6
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: listHotel.length,
                itemBuilder: (context, snapshot) {
                  return itemListHotel(listHotel[snapshot]);
                }))
      ],
    );
}
  Widget itemTabBarView(NameHotel nameHotel) {
    return GestureDetector(
      onTap: (){pushTo(context, HotelDetaiPage(hotelName: nameHotel,));},
      child: Card(
        margin: EdgeInsets.only(right: setWidth(22)),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(getAssetsImage(nameHotel.url??"")),
                fit: BoxFit.cover,
                scale: 2.0),
          ),
          width: setWidth(180),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  for (int i = 0; i < nameHotel.rating??""; i++)
                    Icon(Icons.star, color: ColorUtils.RED_BACKGROUND),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameHotel.nameHote??"",
                      style: FontUtils.BOLD.copyWith(
                          color: ColorUtils.WHITE_TEXT, fontSize: setSp(17)),
                    ),
                    Text(
                      nameHotel.location??"",
                      style: FontUtils.MEDIUM
                          .copyWith(color: ColorUtils.WHITE_TEXT),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget itemListHotel(Hotel hotel) {
    return GestureDetector(
      onTap: () {
        pushAnimatin(context, PlaygroundPage(hotel: hotel));
      },
      child: Container(
        margin: EdgeInsets.only(top: setHeight(10)),
        padding: EdgeInsets.only(
            top: setHeight(10), bottom: setHeight(10), left: setWidth(16)),
        height: setHeight(150),
        decoration: BoxDecoration(
          color: ColorUtils.WHITE_TEXT,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              elevation: 0.0,
              child: Container(
                width: setWidth(140),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(getAssetsImage(hotel.nameUrl ?? "")))),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        bottom: setHeight(6), top: setHeight(20)),
                    width: setWidth(100),
                    child: Text(
                      hotel.hotelName ?? "",
                      style: FontUtils.BOLD,
                      maxLines: 2,
                    )),
                Row(
                  children: [
                    for (int i = 0; i < hotel.rating; i++)
                      Icon(
                        Icons.star,
                        color: ColorUtils.YELLOW_TEXT,
                        size: 14,
                      ),
                    SizedBox(width: setWidth(10)),
                    Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: ColorUtils.blueAccent,
                    ),
                    Text(hotel.Location ?? "",
                        style: FontUtils.MEDIUM.copyWith(
                            color: ColorUtils.blueAccent, fontSize: setSp(12))),
                  ],
                ),
                SizedBox(height: setHeight(6)),
                Row(
                  children: [
                    Image.asset(
                      getAssetsIcon("di_dung.png"),
                      color: ColorUtils.TEXT_NAME,
                      height: setHeight(16),
                    ),
                    Text(
                      hotel.formdate ?? "",
                      style: FontUtils.MEDIUM
                          .copyWith(color: ColorUtils.TEXT_NAME),
                    ),
                    SizedBox(width: setWidth(20)),
                    Image.asset(
                      getAssetsIcon("ve_dung.png"),
                      color: ColorUtils.TEXT_NAME,
                      height: setHeight(16),
                    ),
                    Text(
                      hotel.todate ?? "",
                      style: FontUtils.MEDIUM
                          .copyWith(color: ColorUtils.TEXT_NAME),
                    )
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  size: setSp(14),
                  color: ColorUtils.NUMBER_PAGE,
                ),
                Column(
                  children: [
                    hotel.moneySale == null
                        ? SizedBox()
                        : Text(
                            Utilities.formatMoney(hotel.moneySale ?? "",
                                suffix: ""),
                            style: FontUtils.MEDIUM
                                .copyWith(color: ColorUtils.NUMBER_PAGE)),
                    hotel.moneySale != null
                        ? Text(
                            Utilities.formatMoney(hotel.money ?? "",
                                suffix: ""),
                            style: FontUtils.MEDIUM.copyWith(
                                color: ColorUtils.RED_BACKGROUND,
                                decoration: TextDecoration.lineThrough))
                        : Text(
                            Utilities.formatMoney(hotel.money ?? "",
                                suffix: ""),
                            style: FontUtils.MEDIUM
                                .copyWith(color: ColorUtils.NUMBER_PAGE),
                          )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class HistoryHotel{
  String name;
  String url;
  String brithday;
  String mobile;
  String dateStr;
  String urlRoom;
  String nameRoom;
  String moneyRoom;
  String nameHotel;
  String address;

  HistoryHotel(
      this.name, this.brithday, this.mobile,
      this.dateStr, this.url,{ this.nameRoom,
        this.urlRoom, this.moneyRoom, this.nameHotel, this.address});
}
class NameHotel{
  int type;
  String nameHote;
  String url;
  String location;
  String moneyRoom;
  int rating;
  String introHotel;
  NameHotel(this.type, this.nameHote, this.url, this.location, this.moneyRoom,
      this.rating, this.introHotel);

}
class Hotel {
  int type;
  String hotelName;
  String nameUrl;
  String Location;
  String LocationDetail;
  int rating;
  double money;
  double moneySale;
  String formdate;
  String todate;
  String intro;
  List<News> listNews;
  List<logoImage> listLogo;
  Contact contact;

  Hotel(this.type, this.hotelName, this.nameUrl, this.Location, this.rating,
      this.money,
      {this.formdate,
      this.todate,
      this.moneySale,
      this.LocationDetail,
      this.intro,
      this.listNews,
      this.listLogo,
      this.contact});
}
class News {
  String nameNews;
  String imageUrl;
  String date;
  String news;
  News(this.nameNews, this.imageUrl, this.date, this.news);
}
class logoImage {
  String imageUrl;
  logoImage(this.imageUrl);
}
class Contact {
  String name;
  String address;
  String mobile;
  String phoneNumber;
  String hotline;
  String email;

  Contact(this.name, this.address, this.mobile, this.phoneNumber, this.hotline,
      this.email);
}
class Address{
  String Name;
  String provinceName;
  String districtName;
  String communeName;

  Address(this.Name, this.provinceName, this.districtName, this.communeName);
}

List<Address> listAddress = [
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Đông Triều", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Đông Triều"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Hưng Đạo", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Hưng Đạo"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Kim Sơn", "Tỉnh Quảng Ninh", "Thị xã Đông Triều","Phường Kim Sơn"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Mạo Khê", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Mạo Khê"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Xuân Sơn", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Xuân Sơn"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Đông Triều", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Đông Triều"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Phường Đức Chính", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Phường Đức Chính"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Xã An Sinh", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Xã An Sinh"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Xã Bình Dương", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Xã Bình Dương"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Xã Bình Khê", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Xã Bình Khê"),
  Address("Tỉnh Quảng Ninh - Thị xã Đông Triều - Xã Hoàng Quế", "Tỉnh Quảng Ninh", "Thị xã Đông Triều", "Xã Hoàng Quế"),
];
List<NameHotel> listNameHotel = [
  NameHotel(1, "Luxyry Hotel", "hotel1.jpg", "Hạ long", "50", 5, ""),
  NameHotel(2, "Mường Thanh Hotel", "hotel1.jpg", "Hạ long", "50", 5, ""),
  NameHotel(3, "Luxyry Hotel", "hotel1.jpg", "Hạ long", "50", 5, ""),
];
List<Hotel> listHotel = [
  Hotel(
    1,
    "Dragon Park - Sun World Ha Long Complex",
    "hlp.jpg",
    "Hạ Long",
    5,
    16,
    formdate: "08:00",
    todate: "20:00",
    moneySale: 14,
    LocationDetail:
        "Số 9 đường Hạ Long, phường Bãi Cháy, thành phố Hạ Long, tỉnh Quảng Ninh, Việt Nam.",
    intro:
        "Quần thể du lịch giải trí Sun World Halong Complex là sản phẩm của Tập đoàn Sun Group mang đến muôn vàn trải nghiệm: "
        "\n• Phấn khích với các trò chơi cảm giác mạnh tại Công Viên Rồng – Dragon Park"
        "\n• Thách thức nắng hè tại Công Viên Nước Typhoon Water Park"
        "\n• Thích thú với cáp treo Nữ Hoàng chiêm ngưỡng Vịnh Hạ Long"
        "\n• Hòa mình trong không gian mang đậm phong cách Nhật Bản tại đồi Ba Đèo"
        "\n• Thư thái trong làn nước xanh mát tại bãi biển Sun World• Thư thái trong làn nước xanh mát tại bãi biển Sun World"
        "\n• Thưởng thức ẩm thực và thỏa thích mua sắm",
    listNews: [
      News(
          "THÔNG BÁO: SUN WORLD HALONG COMPLEX tạm dừng hoạt động từ 06/05/2021!",
          "COVID2.png",
          "6 May, 2021",
          "Trước những diễn biến phức tạp của tình hình dịch bệnh Covid-19, để bảo vệ an toàn cho khách hàng và nhân viên, tránh tập trung đông người, chúng tôi xin thông báo về việc tạm thời đóng cửa công viên Sun World Halong Complex từ ngày 06/05/2021. Chúng tôi sẽ thông báo thời gian hoạt động trở lại sau!Công ty TNHH Mặt Trời Hạ Long – Chi nhánh Công viên Sun World Hạ Long xin thông báo tới Quý khách hàng!"),
      News(
          "NGÀY HỘI KẾT NỐI XANH – SỰ KIỆN VÌ MÔI TRƯỜNG LỚN NHẤT TẠI QUẢNG NINH 2021",
          "sukien.png",
          "8 April, 2021",
          "Ngày hội Kết nối Xanh là sự kiện vì môi trường sẽ được tổ chức vào ngày 24/04/2021 hứa hẹn thu hút hàng ngàn người tham gia tại Sun World Hạ Long."
              "\nĐây là hoạt động nằm trong khuôn khổ dự án khuôn khổ dự án “Xây dựng Mạng lưới Hành động về Tiết giảm – Tái sử dụng – Tái chế (3Rs) rác thải nhựa tại Việt Nam” – Plastic Action Network (PAN)..."),
      News(
          "COMBO RỘN RÀNG – SẴN SÀNG CUỘC VUI",
          "1hlc.png",
          "17 March, 2021",
          "Từ ngày 13/03/2021, Sun World Halong Complex hẹn gặp bạn với vô vàn ưu đãi, để bạn tha hồ tận hưởng những cuộc phiêu lưu “không giới hạn” vào thế giới diệu kì!"
              "\nCáp treo Nữ Hoàng và Công viên chủ đề Drangon Park áp dụng đồng giá 100.000 VND mỗi vé. Đặc biệt, bạn có thể mua Combo hai vé cáp treo và công viên chỉ với 150.000 VND/ vé. Khi sở hữu vé cáp treo hoặc vé combo, bạn sẽ được miễn phí 100% vé tham quan Bảo tàng tượng sáp, Vòng quay Mặt Trời Sun Wheel, quần thể văn hóa Bảo Hải Linh Thông Tự, vườn Nhật Zen Garden, Máng trượt lốc xoáy 3 vòng Samurai,…"),
    ],
    listLogo: [
      logoImage("badan.jpg"),
      logoImage("catba.png"),
      logoImage("logo_banahills.png"),
      logoImage("logo_fansipan.png"),
      logoImage("logo_honthom.png"),
      logoImage("logo_stroke.png"),
    ],
    contact: Contact(
        "Sun World Halong Complex",
        "Số 9 đường Hạ Long, phường Bãi Cháy, \nthành phố Hạ Long, tỉnh Quảng Ninh",
        "0203 3616 838",
        "0888 855 621",
        "0989 200 699",
        "halongcomplex@sunworld.vn"),
  ),
  Hotel(
    2,
    "Cozrum Homes Charming Cornerl",
    "hotel2.jpg",
    "Hà Nội",
    4,
    30,
  ),
  Hotel(3, "TOUR BÀ NÀ HILLS – CÂY CẦU VÀNG", "banahi.jpg", "Đà Nẵng", 4, 40,
      formdate: "07:00",
      todate: "17:00",
      moneySale: 37,
      LocationDetail:
          "Thôn An Sơn, xã Hòa Ninh, huyện Hòa Vang, TP Đà Nẵng, Việt Nam.",
      intro:
          "Đến với Sun World Ba Na Hills, du khách sẽ được trải nghiệm khí hậu bốn mùa trong một ngày, chu du trên những tuyến cáp treo, đắm chìm trong cảnh quan thiên nhiên của những cánh rừng nguyên sinh nối tiếp ở Bà Nà Núi Chúa, thưởng thức ẩm thực đa dạng và tận hưởng không khí lễ hội ngập tràn.",
      listNews: [
        News(
            "KHÁM PHÁ ĐÊM CHÂU ÂU HUYỀN ẢO TRÊN ĐỈNH BÀ NÀ",
            "bana.png",
            "19 April, 2021",
            "Chính thức trở lại từ ngày 30.04.2021, Combo Ba Na by night sẽ mang đến cho du khách một trải nghiệm độc đáo cùng mức giá vô cùng ưu đãi. \n Combo trải nghiệm đêm Bà Nà – Ba Na by night của khu du lịch đem đến cho du khách cơ hội được du ngoạn Bà Nà với mức giá chỉ 650.000 đồng/người. Chi phí này đã bao gồm xe bus đưa đón từ các điểm trung tâm trong nội thành Đà Nẵng lên đến khu du lịch, vé cáp treo, suất ăn buffet. \nChưa hết, sở hữu combo Đêm Bà Nà vô cùng hấp dẫn này, du khách còn có thể vui chơi thỏa sức tại Fantasy Park- công viên trong nhà lớn nhất Việt Nam..."),
        News(
            "RỘN RÀNG CÙNG “LỄ HỘI ẨM THỰC & BIA” TẠI SUN WORLD BA NA HILLS",
            "ban1.jpg",
            "19 April, 2021",
            "Hòa mình trong không khí rộn ràng tại “Xứ sở hội hè” cùng lễ hội Ẩm thực và Bia – B’estival, hãy cùng đánh thức mọi giác quan và đắm chìm trong Cuộc vui không khoảng cách cùng hàng loạt hoạt động trải nghiệm:\n"),
        News(
            "Amazing Ba Na Hills – Bà Nà Hills miền diệu kỳ",
            "ban2.png",
            "17 April, 2021",
            "Hãy cùng tới và khám phá Sun World Ba Na Hills – miền diệu kỳ với những thanh âm lễ hội rộn ràng mang đậm sắc màu Châu Âu thời trung cổ. Hòa mình vào “Cuộc vui không khoảng cách” tại Xứ sở của những bữa tiệc bất tận, hay đắm chìm trong không gian nghệ thuật của Show diễn chủ đề được trình diễn bởi những vũ công quốc tế.")
      ],
      listLogo: [
        logoImage("badan.jpg"),
        logoImage("catba.png"),
        logoImage("logo_banahills.png"),
        logoImage("logo_fansipan.png"),
        logoImage("logo_honthom.png"),
        logoImage("logo_stroke.png"),
      ],
      contact: Contact(
          "BÀ NÀ HILLS",
          "Thôn An Sơn, xã Hòa Ninh, huyện Hòa \n Vang, TP Đà Nẵng, Việt Nam",
          "(+84) 236 3749 888",
          "(+84) 236 3791 888",
          "+ 84 (0) 905 766 777",
          " banahills@sunworld.vn")),
  Hotel(
    4,
    "Luxury Hotel",
    "hotel2.jpg",
    "Phú Quốc",
    2,
    30,
  ),
];
