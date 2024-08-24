part of 'women_bloc.dart';

abstract class WomenEvent {
  const WomenEvent();

  @override
  List<Object> get props => [];
}

class LoadProductWomen extends WomenEvent {}
