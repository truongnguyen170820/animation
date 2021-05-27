import 'package:animation/getX/controller/product_controller.dart';
import 'package:animation/utils/color_utils.dart';
import 'package:animation/utils/font_utils.dart';
import 'package:animation/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx((){
        if(productController.isLoading.value) return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index){
            return Row(
              children: [
                Container(
                  width: setWidth(150),
                  height: setHeight(100),
                  margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(productController.productList[index].imageLink??"", width: setWidth(150),
                    height: setHeight(100),
                      fit: BoxFit.fill,
                      color: ColorUtils.gray2,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productController.productList[index].name??"", style: FontUtils.MEDIUM),
                    Text(productController.productList[index].brand??"", style: FontUtils.MEDIUM),
                    Text(productController.productList[index].category??"", style: FontUtils.MEDIUM),
                  ],
                )
              ],
            );
          });
      }),
    );
  }
}
