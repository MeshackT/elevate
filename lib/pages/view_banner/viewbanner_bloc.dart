import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate/models/banner_model.dart';
import 'package:meta/meta.dart';

import '../../utils/utils.dart';

part 'viewbanner_event.dart';
part 'viewbanner_state.dart';

class ViewbannerBloc extends Bloc<ViewbannerEvent, ViewbannerState> {
  ViewbannerBloc() : super(ViewbannerInitial()) {
    // loading product
    on<LoadBanner>((event, emit) async {
      try {
        emit(ViewBannersLoading());

        final productsSnapshot =
            await FirebaseFirestore.instance.collection('banners').get();

        final banner = productsSnapshot.docs
            .map((doc) => BannerModel.fromMap(doc.data()))
            .toList();
        Utils.logger.i(banner);

        emit(ViewBannersLoaded(banner));
      } catch (e) {
        emit(ViewBannersError('Failed to load banners: $e'));
      }
    });
    on<DeleteBanner>((event, emit) async {
      try {
        emit(ViewBannersLoading());

        await FirebaseFirestore.instance
            .collection('banners')
            .doc(event.bannerId)
            .delete();

        // Refresh the list after deletion
        add(LoadBanner());
      } catch (e) {
        emit(ViewBannersError('Failed to delete banner: $e'));
      }
    });

    on<NavigateToBanner>((event, emit) async {
      emit(NavigateToBannerState());
    });
  }
}
