import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../utils/utils.dart';

part 'women_event.dart';
part 'women_state.dart';

class WomenBloc extends Bloc<WomenEvent, WomenState> {
  WomenBloc() : super(WomenInitial()) {
    on<WomenEvent>((event, emit) async {
      try {
        emit(WomenLoading());

        final productsSnapshot = await FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: "women")
            .get();

        final products = productsSnapshot.docs
            .map((doc) => ProductModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(products);

        emit(WomenSuccess(products));
      } catch (e) {
        emit(WomenFailure('Failed to load products: $e'));
      }
    });
  }
}
