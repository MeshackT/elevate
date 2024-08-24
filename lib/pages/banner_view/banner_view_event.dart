part of 'banner_view_bloc.dart';

@immutable
abstract class BannerViewEvent {
  @override
  List<Object> get props => [];
}

// get the category you want to pass
class LoadBannerEvent extends BannerViewEvent {
  final String category;

  LoadBannerEvent(this.category);

  @override
  List<Object> get props => [category];
}
