import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../utils/utils.dart';

part 'kids_event.dart';
part 'kids_state.dart';

class KidsBloc extends Bloc<KidsEvent, KidsState> {
  KidsBloc() : super(KidsInitial()) {
    // loading product
    on<KidsEvent>((event, emit) async {
      try {
        emit(KidsLoading());

        final productsSnapshot = await FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: "kids")
            .get();

        final products = productsSnapshot.docs
            .map((doc) => ProductModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(products);

        emit(KidsSuccess(products));
      } catch (e) {
        emit(KidsFailure('Failed to load products: $e'));
      }
    });
  }
}
