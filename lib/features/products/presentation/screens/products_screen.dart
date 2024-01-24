import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/products/presentation/products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/products_response.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(const ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryLightColor,
      appBar: AppBar(
        backgroundColor: ColorPicker.primaryColor,
        title: const Text('Products'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoadedState) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemCount: state.products?.length,
                itemBuilder: (context, index) {
                  final Product product = state.products?[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        RouteConstants.details,
                        arguments: product.id),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(
                              width: 1.5,
                              color:
                                  ColorPicker.primaryColor.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              product.thumbnail,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    product.title,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    product.brand,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '\$${product.price}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: ColorPicker.priceTextColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
