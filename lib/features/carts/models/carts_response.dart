import 'dart:convert';

CartsResponse cartsResponseFromJson(String str) =>
    CartsResponse.fromJson(json.decode(str));

String cartsResponseToJson(CartsResponse data) => json.encode(data.toJson());

class CartsResponse {
  String status;
  List<Cart> carts;

  CartsResponse({
    required this.status,
    required this.carts,
  });

  factory CartsResponse.fromJson(Map<String, dynamic> json) => CartsResponse(
        status: json["status"],
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
      };
}

class Cart {
  String id;
  String title;
  String brand;
  String thumbnail;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Cart({
    required this.id,
    required this.title,
    required this.brand,
    required this.thumbnail,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        title: json["title"],
        brand: json["brand"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "brand": brand,
        "thumbnail": thumbnail,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
