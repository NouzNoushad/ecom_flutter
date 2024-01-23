import 'dart:convert';

import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/features/products/model/products_response.dart';
import 'package:ecommerce_flutter/features/products/model/single_product_response.dart';

abstract class ProductDataSource {
  getProducts();
  getSingleProduct(int id);
}

class ProductDataSourceImpl extends ProductDataSource {
  ProductDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<List<dynamic>?> getProducts() async {
    String url = '${Endpoints.baseUrl}/${Endpoints.products}';
    String response = await apiConsumer.getResponse(url);
    ProductsResponse productsResponse =
        ProductsResponse.fromJson(jsonDecode(response));
    // logger('products', productsResponse.products);
    return productsResponse.products;
  }

  @override
  Future<dynamic> getSingleProduct(int id) async {
    String url = '${Endpoints.baseUrl}/${Endpoints.product}/$id';
    String response = await apiConsumer.getResponse(url);
    SingleProductResponse productResponse =
        SingleProductResponse.fromJson(jsonDecode(response));
    // logger('product', productResponse.product);
    return productResponse.product;
  }
}
