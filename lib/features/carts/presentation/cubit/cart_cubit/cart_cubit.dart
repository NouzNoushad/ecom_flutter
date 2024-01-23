import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/features/carts/data_source/cart_data_source.dart';
import 'package:ecommerce_flutter/features/carts/models/cart_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartDartSource}) : super(const CartState());
  final CartDartSource cartDartSource;

  createCart(CartModel cartModel) async {
    await cartDartSource.createCart(cartModel);
  }
}
