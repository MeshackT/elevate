part of 'uploadbanner_bloc.dart';

@immutable
abstract class UploadbannerState {}

class UploadbannerInitial extends UploadbannerState {}

//

class FileBannerSelected extends UploadbannerState {
  final Uint8List fileBytes;
  final int statusIndex;

  FileBannerSelected(this.fileBytes, this.statusIndex);
}

class BannerSaving extends UploadbannerState {}

class BannerSaved extends UploadbannerState {}
