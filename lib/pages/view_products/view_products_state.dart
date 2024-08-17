part of 'view_products_bloc.dart';

@immutable
abstract class ViewProductsState {}

class ViewProductsInitial extends ViewProductsState {}

class ViewProductsLoading extends ViewProductsState {}

class ViewProductsLoaded extends ViewProductsState {
  final List<ProductModel> products;

  ViewProductsLoaded(this.products);
}

class ViewProductsError extends ViewProductsState {
  final String message;

  ViewProductsError(this.message);
}

class ProductDeleted extends ViewProductsState {}
