import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate/utils/utils.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';

part 'view_products_event.dart';
part 'view_products_state.dart';

class ViewProductsBloc extends Bloc<ViewProductsEvent, ViewProductsState> {
  ViewProductsBloc() : super(ViewProductsInitial()) {
    // loading product
    on<LoadProducts>((event, emit) async {
      try {
        emit(ViewProductsLoading());

        final productsSnapshot =
            await FirebaseFirestore.instance.collection('products').get();

        final products = productsSnapshot.docs
            .map((doc) => ProductModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(products);

        emit(ViewProductsLoaded(products));
      } catch (e) {
        emit(ViewProductsError('Failed to load products: $e'));
      }
    });
    on<DeleteProduct>((event, emit) async {
      try {
        emit(ViewProductsLoading());

        await FirebaseFirestore.instance
            .collection('products')
            .doc(event.productId)
            .delete();

        // Refresh the list after deletion
        add(LoadProducts());
      } catch (e) {
        emit(ViewProductsError('Failed to delete product: $e'));
      }
    });
  }
}
