part of 'view_products_bloc.dart';

abstract class ViewProductsEvent {}

class LoadProducts extends ViewProductsEvent {}

// delete an Item
class DeleteProduct extends ViewProductsEvent {
  final String productId;

  DeleteProduct(this.productId);
}
