import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/core/utils/extensions.dart';
import 'package:ecommerce_flutter/features/carts/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(const GetCartsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryLightColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorPicker.primaryColor,
          title: const Text('Cart')),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is DeleteCartState) {
            context.snackBar(state.message);
          }
        },
        builder: (context, state) {
          if (state is CartsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartsLoadedState) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemBuilder: (context, index) {
                  final cart = state.carts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: context.height * 0.18,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.width * 0.3,
                            height: context.height,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              child: Image.network(
                                cart.thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  cart.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  cart.brand,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '\$${cart.price}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorPicker.priceTextColor),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(DeleteCartEvent(cart.id));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorPicker.primaryColor,
                              )),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    ),
                itemCount: state.carts.length);
          }
          return Container();
        },
      ),
    );
  }
}
