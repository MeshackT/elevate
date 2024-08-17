part of 'viewbanner_bloc.dart';

@immutable
abstract class ViewbannerState {}

class ViewbannerInitial extends ViewbannerState {}

class ViewBannersLoading extends ViewbannerState {}

class ViewBannersLoaded extends ViewbannerState {
  final List<BannerModel> banners;

  ViewBannersLoaded(this.banners);
}

class ViewBannersError extends ViewbannerState {
  final String message;

  ViewBannersError(this.message);
}

class BannerDeleted extends ViewbannerState {}

// navigate to banner
class NavigateToBannerState extends ViewbannerState {}
