part of 'kids_bloc.dart';

abstract class KidsState {
  const KidsState();

  @override
  List<Object> get props => [];
}

class KidsInitial extends KidsState {}

class KidsLoading extends KidsState {}

class KidsSuccess extends KidsState {
  final List<ProductModel> KidsProducts;

  KidsSuccess(this.KidsProducts);

  @override
  List<Object> get props => [KidsProducts];
}

class KidsFailure extends KidsState {
  final String error;

  const KidsFailure(this.error);

  @override
  List<Object> get props => [error];
}

class NavigateToKidsState extends KidsState {}
