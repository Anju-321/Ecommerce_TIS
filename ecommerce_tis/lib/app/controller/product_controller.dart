import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../../core/service/urls.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  RxList<Product> productList = <Product>[].obs;
  RxList<Cart> cartList = <Cart>[].obs;
  Box<Cart> cartBox = Hive.box<Cart>('cartBox');

  getProduct() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final productdata = ProductResponse.fromJson(data);
      return productdata.data;
    } else {
      return [];
    }
  }

  @override
  void onInit() async {
    super.onInit();
    productList.value = await getProduct();
    cartList.value = cartBox.values.toList();
  }

  Future<Box<Cart>> getCartBox() async {
    return Hive.box<Cart>('cart');
  }

  void addToCart(Product product) {
    final cartItem = cartBox.values.firstWhere(
      (item) => item.productName == product.name,
      orElse: () => Cart(product.image, product.price, 0, 0, product.name,
          id: product.id),
    );

    if (cartItem.quantity == 0) {
      cartBox.put(
          product.id,
          Cart(product.image, product.price, 1, product.price, product.name,
              id: product.id));
    } else {
      cartBox.put(
        product.id,
         Cart(
          product.image,         
          product.price,
          cartItem.quantity + 1,
          cartItem.unitPrice * (cartItem.quantity + 1),
          product.name,
          id: product.id
        ),
      );
    }

      cartList.value = cartBox.values.toList();

    update();
  }


   void removeFromCart(Product product) {
    final cartItem = cartBox.values.firstWhere(
      (item) => item.productName == product.name,
      orElse: () => Cart(product.image, product.price, 0, 0, product.name,
          id: product.id),
    );

    if (cartItem.quantity > 1) {
      cartBox.put(
        product.id,
        Cart(
          product.image,         
          product.price,
          cartItem.quantity -1,
          cartItem.unitPrice * (cartItem.quantity - 1),
          product.name,
          id: product.id
        ),
      );
    } else {
      cartBox.delete(product.id);
    }

    cartList.value = cartBox.values.toList();
    update();
  }

   Cart findCartItemById(int productId) {
  return cartList.firstWhere(
    (item) => item.id == productId,
    orElse: () => Cart('', 0, 0, 0, '', id: productId),
  );
}
}
