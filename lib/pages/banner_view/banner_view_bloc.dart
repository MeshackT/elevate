import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'banner_view_event.dart';
part 'banner_view_state.dart';

class BannerViewBloc extends Bloc<BannerViewEvent, BannerViewState> {
  BannerViewBloc() : super(BannerViewInitial()) {
    // Define a map that holds the category to banner image mapping.
    final Map<String, String> _bannerImages = {
      'men': 'images/banner_mens.webp',
      'women': 'images/banner_women.webp',
      'kids': 'images/banner_kids.webp',
    };
    // Handle LoadBannerEvent using the on<Event> method.
    on<LoadBannerEvent>((event, emit) {
      // Retrieve the image from the map based on the category, or use a default image.
      final banner = _bannerImages[event.category] ?? 'images/banner_kids.webp';

      emit(BannerLoaded(banner));
    });
  }
}
