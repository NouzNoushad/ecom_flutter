class Endpoints {
  static const String url = "http://10.0.2.2:3000";
  static const String baseUrl = "$url/api";
  // authentication
  static const String register = "register_user";
  static const String login = "login_user";
  static const String logout = "logout_user";
  // products
  static const String products = "products/get_products";
  static const String product = "products/get_product";
  // carts
  static const String createCart = "carts/create_cart";
  static const String carts = "carts/get_carts";
  static const String deleteCart = "carts/delete_cart";
  // profile
  static const String profile = "profile/get_profile";
}
