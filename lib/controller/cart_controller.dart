import 'package:flutter_application_1/reposority/cart_reposority.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartRepository cartRepositry = CartRepository();
  var isLoading = false.obs;
  var subtotal = 0.0.obs;
  List carts = [].obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    isLoading(true);
    var productsList = await cartRepositry.loadCartFromApi();
    //??? ???? ??? ?????? ????? ???? ?????? ?? ???? ?? id
    for (var i = 0; i < productsList.length; i++) {
      var product =
          await cartRepositry.getProductFromApi(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      carts.add({
        "product": product,
        "quantity": productsList[i]["quantity"],
      });
    }

    isLoading(false);
  }
}
