part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsLoadedEvent extends ProductsEvent {
  const ProductsLoadedEvent();

  @override
  List<Object> get props => [];
}

class SingleProductLoadedEvent extends ProductsEvent {
  const SingleProductLoadedEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
