import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/core/utils/extensions.dart';
import 'package:ecommerce_flutter/features/carts/models/cart_model.dart';
import 'package:ecommerce_flutter/features/carts/presentation/bloc/cart_bloc/cart_bloc.dart';

import 'package:ecommerce_flutter/features/products/model/single_product_response.dart';
import 'package:ecommerce_flutter/features/products/presentation/products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    context
        .read<ProductsBloc>()
        .add(SingleProductLoadedEvent(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPicker.primaryColor,
        title: const Text('Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(RouteConstants.bottomNav);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacementNamed(RouteConstants.bottomNav);
          return true;
        },
        child: SafeArea(child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is SingleProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SingleProductLoadedState) {
              final Product product = state.product;
              return BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is CreateCartState) {
                    context.snackBar(state.message);
                  }
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: context.height,
                      width: context.width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: context.height * 0.4,
                            child: Image.network(product.thumbnail),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  product.brand,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    color: ColorPicker.priceTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  product.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: context.height * 0.07,
                          width: context.height * 0.3,
                          child: ElevatedButton(
                            onPressed: () async {
                              CartModel cartModel = CartModel(
                                  title: product.title,
                                  brand: product.brand,
                                  price: product.price,
                                  thumbnail: product.thumbnail);
                              context
                                  .read<CartBloc>()
                                  .add(CreateCartEvent(cartModel));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        )),
      ),
    );
  }
}
