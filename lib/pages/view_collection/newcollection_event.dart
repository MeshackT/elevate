part of 'newcollection_bloc.dart';

@immutable
abstract class NewcollectionEvent {}

class LoadNewcollections extends NewcollectionEvent {}

// delete an Item
class DeleteNewcollection extends NewcollectionEvent {
  final String newCollectionId;

  DeleteNewcollection(this.newCollectionId);
}

// navigate to collection
class NavigateToNewCollection extends NewcollectionEvent {}
