import 'dart:convert';

CreateCartResponse createCartResponseFromJson(String str) =>
    CreateCartResponse.fromJson(json.decode(str));

String createCartResponseToJson(CreateCartResponse data) =>
    json.encode(data.toJson());

class CreateCartResponse {
  String message;
  SingleCart cart;

  CreateCartResponse({
    required this.message,
    required this.cart,
  });

  factory CreateCartResponse.fromJson(Map<String, dynamic> json) =>
      CreateCartResponse(
        message: json["message"],
        cart: SingleCart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "cart": cart.toJson(),
      };
}

class SingleCart {
  String id;
  String title;
  String brand;
  int price;
  String thumbnail;

  SingleCart({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.thumbnail,
  });

  factory SingleCart.fromJson(Map<String, dynamic> json) => SingleCart(
        id: json["id"],
        title: json["title"],
        brand: json["brand"],
        price: json["price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "brand": brand,
        "price": price,
        "thumbnail": thumbnail,
      };
}
