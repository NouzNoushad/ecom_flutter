part of 'cart_bloc.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartsLoadingState extends CartState {}

class CreateCartState extends CartState {
  const CreateCartState(this.message);
  final String message;
}

class DeleteCartState extends CartState {
  const DeleteCartState(this.message);
  final String message;
}

class CartsLoadedState extends CartState {
  const CartsLoadedState(this.carts);
  final List<Cart> carts;
}

class CartErrorState extends CartState {
  const CartErrorState(this.error);
  final String error;
}
