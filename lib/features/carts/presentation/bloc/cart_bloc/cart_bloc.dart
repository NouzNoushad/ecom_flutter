import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/features/carts/data_source/cart_data_source.dart';
import 'package:ecommerce_flutter/features/carts/models/cart_model.dart';
import 'package:ecommerce_flutter/features/carts/models/carts_response.dart';

import '../../../../../core/utils/constants.dart';
import '../../../models/create_cart_response.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartDartSource cartDartSource;
  CartBloc({required this.cartDartSource}) : super(CartInitial()) {
    on<CreateCartEvent>(createCart());
    on<GetCartsEvent>(getCarts());
    on<DeleteCartEvent>(deleteCart());
  }

  EventHandler<CreateCartEvent, CartState> createCart() =>
      ((event, emit) async {
        try {
          String? response = await cartDartSource.createCart(event.cartModel);
          if (response != null) {
            var cartResponse =
                CreateCartResponse.fromJson(jsonDecode(response));
            logger('create cart', cartResponse.message);
            emit(CreateCartState(cartResponse.message));
          }
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      });

  EventHandler<GetCartsEvent, CartState> getCarts() => ((event, emit) async {
        emit(CartsLoadingState());
        try {
          String? response = await cartDartSource.getCarts();
          if (response != null) {
            var cartResponse = CartsResponse.fromJson(jsonDecode(response));
            emit(CartsLoadedState(cartResponse.carts));
          }
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      });

  EventHandler<DeleteCartEvent, CartState> deleteCart() =>
      ((event, emit) async {
        try {
          String? response = await cartDartSource.deleteCart(event.cartId);
          if (response != null) {
            String message = jsonDecode(response)['message'];
            add(const GetCartsEvent());
            emit(DeleteCartState(message));
          }
        } catch (error) {
          emit(CartErrorState(error.toString()));
        }
      });
}
