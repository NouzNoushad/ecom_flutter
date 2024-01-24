import 'dart:convert';

import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/features/carts/models/cart_model.dart';

abstract class CartDartSource {
  createCart(CartModel cartModel);
  getCarts();
  deleteCart(String cartId);
}

class CartDartSourceImpl extends CartDartSource {
  CartDartSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;
  @override
  createCart(CartModel cartModel) async {
    String url = '${Endpoints.baseUrl}/${Endpoints.createCart}';
    Map<String, dynamic> body = {
      "title": cartModel.title,
      "brand": cartModel.brand,
      "price": cartModel.price,
      "thumbnail": cartModel.thumbnail,
    };
    String response = await apiConsumer.postResponse(url, jsonEncode(body));
    if (response != "") {
      return response;
    }
    return null;
  }

  @override
  getCarts() async {
    String url = '${Endpoints.baseUrl}/${Endpoints.carts}';
    String response = await apiConsumer.getResponse(url);
    if (response != "") {
      return response;
    }
    return null;
  }

  @override
  deleteCart(String cartId) async {
    String url = '${Endpoints.baseUrl}/${Endpoints.deleteCart}/$cartId';
    String response = await apiConsumer.deleteResponse(url);
    if (response != "") {
      return response;
    }
    return null;
  }
}
