part of 'uploadnewcollection_bloc.dart';

@immutable
abstract class UploadnewcollectionState {}

class UploadnewcollectionInitial extends UploadnewcollectionState {}

class FileSelected extends UploadnewcollectionState {
  final Uint8List fileBytes;
  final int statusIndex;

  FileSelected(this.fileBytes, this.statusIndex);
}

class NewCollectionSaving extends UploadnewcollectionState {}

class NewCollectionSaved extends UploadnewcollectionState {}

class NewCollectionFailed extends UploadnewcollectionState {}
