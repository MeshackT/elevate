part of 'banner_view_bloc.dart';

@immutable
abstract class BannerViewState {
  @override
  List<Object> get props => [];
}

class BannerViewInitial extends BannerViewState {}

class BannerLoaded extends BannerViewState {
  final String banner;

  BannerLoaded(this.banner);

  @override
  List<Object> get props => [banner];
}
