import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product_model.dart';
import '../../utils/utils.dart';

part 'men_event.dart';
part 'men_state.dart';

class MenBloc extends Bloc<MenEvent, MenState> {
  MenBloc() : super(MenInitial()) {
    // loading product
    on<LoadProductMen>((event, emit) async {
      try {
        emit(MenLoading());

        final productsSnapshot = await FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: "men")
            .get();

        final products = productsSnapshot.docs
            .map((doc) => ProductModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(products);

        emit(MenSuccess(products));
      } catch (e) {
        emit(MenFailure('Failed to load products: $e'));
      }
    });
  }
}
