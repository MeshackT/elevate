import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/new_collection_model.dart';
import '../../utils/utils.dart';

part 'newcollection_event.dart';
part 'newcollection_state.dart';

class NewcollectionBloc extends Bloc<NewcollectionEvent, NewcollectionState> {
  NewcollectionBloc() : super(NewcollectionInitial()) {
    // loading product
    on<LoadNewcollections>((event, emit) async {
      try {
        emit(ViewNewCollectionsLoading());

        final productsSnapshot =
            await FirebaseFirestore.instance.collection('newCollection').get();

        final products = productsSnapshot.docs
            .map((doc) => NewCollectionModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(products);

        emit(ViewNewCollectionsLoaded(products));
      } catch (e) {
        emit(ViewNewCollectionsError('Failed to load new collection: $e'));
      }
    });
    on<DeleteNewcollection>((event, emit) async {
      try {
        emit(ViewNewCollectionsLoading());

        await FirebaseFirestore.instance
            .collection('newCollection')
            .doc(event.newCollectionId)
            .delete();

        // Refresh the list after deletion
        add(LoadNewcollections());
      } catch (e) {
        emit(ViewNewCollectionsError('Failed to delete new Colleciton: $e'));
      }
    });

    // Navigate
    on<NavigateToNewCollection>((event, emit) async {
      Utils.logger.i("tapped navigate to collections");
      emit(NavigateToNewCollectionState());
    });
  }
}
