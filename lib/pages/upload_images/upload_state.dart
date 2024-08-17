// upload_state.dart
part of 'upload_bloc.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class NavigateToListState extends UploadState {}

class FileSelected extends UploadState {
  final Uint8List fileBytes;
  final int statusIndex;

  FileSelected(this.fileBytes, this.statusIndex);
}

class ProductSaving extends UploadState {}

class ProductSaved extends UploadState {}
