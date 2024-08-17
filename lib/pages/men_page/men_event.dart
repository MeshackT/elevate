part of 'men_bloc.dart';

abstract class MenEvent {
  const MenEvent();

  @override
  List<Object> get props => [];
}

class LoadProductMen extends MenEvent {}
