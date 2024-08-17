part of 'uploadbanner_bloc.dart';

@immutable
abstract class UploadbannerEvent {}

// select file to upload
class SelectBannerFile extends UploadbannerEvent {
  final int statusIndex;
  SelectBannerFile(this.statusIndex);
}

// save the product
class SaveBanner extends UploadbannerEvent {}
