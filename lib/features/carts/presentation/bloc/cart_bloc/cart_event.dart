part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

class CreateCartEvent extends CartEvent {
  const CreateCartEvent(this.cartModel);
  final CartModel cartModel;
}

class GetCartsEvent extends CartEvent {
  const GetCartsEvent();
}

class DeleteCartEvent extends CartEvent {
  const DeleteCartEvent(this.cartId);
  final String cartId;
}
