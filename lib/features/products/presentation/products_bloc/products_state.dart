part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class SingleProductLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  const ProductsLoadedState(this.products);
  final List<dynamic>? products;

  @override
  List<Object> get props => [products!];
}

class SingleProductLoadedState extends ProductsState {
  const SingleProductLoadedState(this.product);
  final dynamic product;

  @override
  List<Object> get props => [product];
}

class ProductsErrorState extends ProductsState {
  const ProductsErrorState(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
