// upload_event.dart
part of 'upload_bloc.dart';

@immutable
abstract class UploadEvent {}

class NavigateToList extends UploadEvent {}

// select file to upload
class SelectFile extends UploadEvent {
  final int statusIndex;
  SelectFile(this.statusIndex);
}

// save the product
class SaveProduct extends UploadEvent {}
