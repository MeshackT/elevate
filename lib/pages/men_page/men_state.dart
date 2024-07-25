part of 'men_bloc.dart';

abstract class MenState {
  const MenState();

  @override
  List<Object> get prop => [];
}

class MenInitial extends MenState {}

// create a state method to do something
class NavigateToCart extends MenState {}
