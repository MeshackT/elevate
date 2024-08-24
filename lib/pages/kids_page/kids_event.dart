part of 'kids_bloc.dart';

@immutable
abstract class KidsEvent {
  const KidsEvent();

  @override
  List<Object> get props => [];
}

class LoadProductKids extends KidsEvent {}
