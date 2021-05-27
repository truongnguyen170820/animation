
import 'package:animation/getX/api/api_service.dart';
import 'package:animation/getX/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var
  productList = List<ProductModel>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProdut();
    super.onInit();
  }
  void fetchProdut()async{
    try{
      isLoading(true);
      var produts = await ApiService.fetchProduct();
      if(produts != null){
        productList.assignAll(produts);
      }
    }
    finally{
      isLoading(false);
    }

  }
}