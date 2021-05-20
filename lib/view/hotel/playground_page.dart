import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/utils/utilities.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class PlaygroundPage extends StatefulWidget {
  final Hotel hotel;
  const PlaygroundPage({Key key, this.hotel}) : super(key: key);


  @override
  _PlaygroundPageState createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {

  DateTime date = DateTime.now();
  var _currentPageNotifier = ValueNotifier<int>(0);
  int type;
  @override
  Widget build(BuildContext context) {
    print(date);
    return Scaffold(
      appBar: appbarDefault(context, widget.hotel.hotelName, bgColor: ColorUtils.underlined),
      backgroundColor: ColorUtils.underlined,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSlideImage(check(widget.hotel.type)),
            _buildBodyPage(widget.hotel),
            // _buildLogo(widget.hotel.listLogo.first),
          ],
        ),
      ),
    );
  }
  //slider Image
  Widget _buildSlideImage(List<String> listImgaeUrl) {
    return Container(
        height: setHeight(175),
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 16/9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  onPageChanged: (int index, CarouselPageChangedReason c) {
                    _currentPageNotifier.value = index;
                  },
                  scrollDirection: Axis.horizontal,),
                items: listImgaeUrl.map((imageSlider) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: double.infinity, width: double.infinity,
                      margin: EdgeInsets.all(setWidth(10)),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(offset: Offset(3,3), blurRadius: 7, color: Colors.grey[300])
                          ],
                          borderRadius: BorderRadius.circular(setWidth(13)),
                          image: DecorationImage(image: AssetImage(getAssetsImage(imageSlider)),fit: BoxFit.cover)),
                    );
                  });
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: setHeight(10)),
              height: setHeight(163),
              alignment: Alignment.bottomCenter,
              child: CirclePageIndicator(
                dotColor: Colors.white,
                selectedDotColor: Colors.blue,
                itemCount: listImgaeUrl.length,
                currentPageNotifier: _currentPageNotifier,
              ),
            )
          ],
        )
    );
  }
  check(int type){
    switch(type){
      case 1:
        return listSlideImageHL.sublist(0,3);
      case 3:
        return listSlideImageHL.sublist(4,6);
      default:
        return listSlideImageDN;
        // return SizedBox();

    }
  }
  Widget _buildBodyPage(Hotel hotel){
    return Container(
      margin: EdgeInsets.only(left: setWidth(16), right: setWidth(16), top: setHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hotel.hotelName??"", style: FontUtils.MEDIUM.copyWith(fontSize: setSp(16))),
          SizedBox(height: setHeight(5)),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 12,
                color: ColorUtils.blueAccent,),
              Text("Địa điểm", style: FontUtils.MEDIUM.copyWith(
                  color: ColorUtils.blueAccent, fontSize: setSp(13))),
            ],
          ),
          SizedBox(height: setHeight(3)),
          Text(hotel.LocationDetail??"", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.gray3,fontSize: setSp(12))),
          Container(
            margin: EdgeInsets.only(top: setHeight(10), bottom: setHeight(16)),
            padding: EdgeInsets.only(left: setWidth(16), right: setWidth(16), top: setHeight(8), bottom: setHeight(10)),
            decoration: BoxDecoration(
              color: ColorUtils.blueAccent,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hotel.Location, style: FontUtils.BOLD.copyWith(color: ColorUtils.WHITE_TEXT, fontSize: setSp(20)),),
                    Text("Việt Nam", style: FontUtils.NORMAL.copyWith(color: ColorUtils.WHITE_TEXT)),
                    Row(
                      children: [
                        Icon(Icons.access_time,color: ColorUtils.WHITE_TEXT,size: setSp(15),),
                        Text(Utilities.formatDate(date), style: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT, fontSize: setSp(12)),),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Giờ mở cửa:", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT)),
                    SizedBox(height: setHeight(5)),
                    Row(
                      children: [
                        Text(hotel.formdate??"--:--", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT)),
                        Text(" Đến ", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT, fontSize: setSp(12))),
                        Text(hotel.todate??"--:--", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.WHITE_TEXT))
                      ],
                    ),
                    SizedBox(height: setHeight(5)),
                    Text("* Đóng cửa", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.underlined, fontSize: setSp(10)),)
                  ],
                )
              ],
            ),
          ),
          Text(hotel.intro??"", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.NUMBER_PAGE)),
         hotel.listNews == null ? SizedBox() :
         Container(
           height: setHeight(600),
           child: ListView(
             scrollDirection: Axis.horizontal,
             children: [
               _buildNews(hotel.listNews.first),
               _buildNews(hotel.listNews[1]),
               _buildNews(hotel.listNews[2]),
             ],
           ),
         ),
          hotel.listLogo == null ? SizedBox() :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("HỆ THỐNG SUNWORLD", style: FontUtils.BOLD.copyWith(color: ColorUtils.NUMBER_PAGE, fontSize: setSp(20)),),
              Container(
                height: setHeight(100),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildLogo(hotel.listLogo[0]),
                    _buildLogo(hotel.listLogo[1]),
                    _buildLogo(hotel.listLogo[2]),
                    _buildLogo(hotel.listLogo[3]),
                    _buildLogo(hotel.listLogo[4]),
                    _buildLogo(hotel.listLogo[5]),
                    // _buildLogo(hotel.listLogo[6]),
                  ],
                ),
              ),
            ],
          ),
          hotel.contact == null ?SizedBox() :
          _buildContact(hotel.contact)
        ],
      ),
    );
  }
  Widget _buildNews(News news){
    return Container(
      width: setWidth(230),
      margin: EdgeInsets.only(left: setWidth(16), top: setHeight(16), bottom: setHeight(16)),
      padding: EdgeInsets.only(left: setWidth(10), top: setHeight(16), right: setWidth(10)),
      decoration: BoxDecoration(
        color: ColorUtils.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorUtils.blueAccent)
      ),
      child: Column(
        children: [
          Image.asset(getAssetsImage(news.imageUrl)),
          SizedBox(height: setHeight(5)),
          SizedBox(height: setHeight(5)),
        Text(news?.nameNews??"", style: FontUtils.BOLD.copyWith(fontSize: setSp(15)), textAlign: TextAlign.justify),
          SizedBox(height: setHeight(5)),
          Text(news.news??"", style: FontUtils.MEDIUM.copyWith(fontSize: setSp(12), color: ColorUtils.TEXT_NAME), textAlign: TextAlign.justify,),
        ],
      ),
    );
  }
  Widget _buildLogo(logoImage logo){
    return Container(
      width: setWidth(200),
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(left: setWidth(16), top: setHeight(5), bottom: setHeight(16)),
      decoration: BoxDecoration(
        color: ColorUtils.WHITE_TEXT,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorUtils.gray)
      ),
      child: Image.asset(getAssetsImage(logo.imageUrl), fit: BoxFit.cover,scale: 1.2,),
    );
  }
  Widget _buildContact(Contact contact){
    return Container(
      margin: EdgeInsets.only(bottom: setHeight(50)),
      height: setHeight(200),
      width: setWidth(343),
      padding: EdgeInsets.only(left: setWidth(16), top: setHeight(16), ),
      decoration: BoxDecoration(
        image: DecorationImage(

          image: AssetImage(getAssetsImage("logo_footer.png"))
        ),
        color: ColorUtils.blueAccent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorUtils.blueAccent)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildC(contact.name,""),
          _buildC("Địa chỉ:",contact.address),
          _buildC("Hotline: ",contact.hotline),
          _buildC("Phone: ",contact.phoneNumber),
          _buildC("Landline: ",contact.mobile),
          _buildC("Email: ",contact.email),
        ],
      ),
    );
}

Widget _buildC(String name, String detail){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(name, style: FontUtils.BOLD.copyWith(color: ColorUtils.colorStatus)),
        Text(detail,style: FontUtils.BOLD.copyWith(color: ColorUtils.WHITE_TEXT) )
      ],
    );
}
}
List<String> listSlideImageHL = ['hlp.jpg', 'hlp2.jpg','hlp1.jpg','banahi.jpg', 'bn1.jpg','bn2.jpg',];
List<String> listSlideImageDN = [];





