part of 'uploadnewcollection_bloc.dart';

@immutable
abstract class UploadnewcollectionEvent {}

// select file to upload
class SelectNewCollectionFile extends UploadnewcollectionEvent {
  final int statusIndex;
  SelectNewCollectionFile(this.statusIndex);
}

// save the product
class SaveNewCollection extends UploadnewcollectionEvent {}

class FailedNewCollection extends UploadnewcollectionEvent {}
