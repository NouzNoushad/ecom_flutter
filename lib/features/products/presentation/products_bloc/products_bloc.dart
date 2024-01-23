import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/features/products/data_source/products_data_source.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductDataSource productDataSource;
  ProductsBloc({required this.productDataSource}) : super(ProductsInitial()) {
    on<ProductsLoadedEvent>(getProducts());
    on<SingleProductLoadedEvent>(getSingleProduct());
  }

  EventHandler<ProductsLoadedEvent, ProductsState> getProducts() =>
      (event, emit) async {
        emit(ProductsLoadingState());
        try {
          List<dynamic> products = await productDataSource.getProducts();
          emit(ProductsLoadedState(products));
        } catch (error) {
          emit(ProductsErrorState(error.toString()));
        }
      };

  EventHandler<SingleProductLoadedEvent, ProductsState> getSingleProduct() =>
      (event, emit) async {
        emit(SingleProductLoadingState());
        try {
          dynamic product = await productDataSource.getSingleProduct(event.id);
          emit(SingleProductLoadedState(product));
        } catch (error) {
          emit(ProductsErrorState(error.toString()));
        }
      };
}
