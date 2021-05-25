import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:animation/view/hotel/appointment_hotel_page.dart';
import 'package:animation/view/hotel/history_booking_page.dart';
import 'package:animation/view/hotel/hotel_page.dart';
import 'package:animation/widget/common_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HotelDetaiPage extends StatefulWidget {
  final NameHotel hotelName;

  const HotelDetaiPage({Key key, this.hotelName}) : super(key: key);

  @override
  _HotelDetaiPageState createState() => _HotelDetaiPageState();
}

class _HotelDetaiPageState extends State<HotelDetaiPage> {
  var _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    print(listHistory);
    return Scaffold(
      appBar: appbarDefault(context, "Thông tin khách sạn", bgColor: ColorUtils.underlined),
      backgroundColor: ColorUtils.underlined,
      body: Column(
        children: [
          _buildSlideImage(check(widget.hotelName.type)),
          _buildBodyHotel(widget.hotelName, )
        ],
      ),
    );
  }
  Widget _buildSlideImage(List<String> listImgaeUrl) {
    return Container(
        height: setHeight(175),
        color: ColorUtils.red1,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 16 / 9,
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
                  scrollDirection: Axis.horizontal,
                ),
                items: listImgaeUrl.map((imageSlider) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: EdgeInsets.all(setWidth(10)),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(3, 3),
                                blurRadius: 7,
                                color: Colors.grey[300])
                          ],
                          borderRadius: BorderRadius.circular(setWidth(13)),
                          image: DecorationImage(
                              image: AssetImage(getAssetsImage(imageSlider)),
                              fit: BoxFit.cover)),
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
        ));
  }
  check(int type) {
    switch (type) {
      case 1:
        return listSlideImageHotel;
      case 3:
        return listSlideImageHotel;
      default:
        return listSlideImageHotel;
    // return SizedBox();

    }
  }
  Widget _buildBodyHotel(NameHotel nameHotel){
    return Column(
      children: [
        Text(nameHotel.nameHote??"", style: FontUtils.MEDIUM.copyWith(color: ColorUtils.blueAccent, fontSize: setSp(16))),
       SizedBox(height: setHeight(30)),
      ],
    );
  }
}
List<String> listSlideImageHotel = [];