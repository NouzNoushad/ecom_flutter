import 'dart:convert';

import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/features/carts/models/cart_model.dart';

abstract class CartDartSource {
  createCart(CartModel cartModel);
}

class CartDartSourceImpl extends CartDartSource {
  CartDartSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;
  @override
  createCart(CartModel cartModel) async {
    String url = '${Endpoints.baseUrl}/${Endpoints.create}';
    Map<String, dynamic> body = {
      "title": cartModel.title,
      "brand": cartModel.brand,
      "price": cartModel.price,
      "thumbnail": cartModel.thumbnail,
    };
    String response = await apiConsumer.postResponse(url, jsonEncode(body));
    logger('create cart', response);
  }
}
