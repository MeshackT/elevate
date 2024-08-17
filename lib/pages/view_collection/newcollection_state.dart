part of 'newcollection_bloc.dart';

@immutable
abstract class NewcollectionState {}

class NewcollectionInitial extends NewcollectionState {}

class ViewNewCollectionsLoading extends NewcollectionState {}

class ViewNewCollectionsLoaded extends NewcollectionState {
  final List<NewCollectionModel> collection;

  ViewNewCollectionsLoaded(this.collection);
}

class ViewNewCollectionsError extends NewcollectionState {
  final String message;

  ViewNewCollectionsError(this.message);
}

class NewCollectionDeleted extends NewcollectionState {}

// navigate to collection
class NavigateToNewCollectionState extends NewcollectionState {}
