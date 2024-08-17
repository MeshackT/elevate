part of 'men_bloc.dart';

abstract class MenState {
  const MenState();

  @override
  List<Object> get props => [];
}

class MenInitial extends MenState {}

class MenLoading extends MenState {}

class MenSuccess extends MenState {
  final List<ProductModel> menProducts;

  MenSuccess(this.menProducts);

  @override
  List<Object> get props => [menProducts];
}

class MenFailure extends MenState {
  final String error;

  const MenFailure(this.error);

  @override
  List<Object> get props => [error];
}
