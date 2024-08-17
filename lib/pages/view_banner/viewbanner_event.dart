part of 'viewbanner_bloc.dart';

@immutable
abstract class ViewbannerEvent {}

class LoadBanner extends ViewbannerEvent {}

// delete an Item
class DeleteBanner extends ViewbannerEvent {
  final String bannerId;

  DeleteBanner(this.bannerId);
}

// navigate to banner
class NavigateToBanner extends ViewbannerEvent {}
