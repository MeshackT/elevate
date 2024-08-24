part of 'women_bloc.dart';

@immutable
abstract class WomenState {
  const WomenState();

  @override
  List<Object> get props => [];
}

class WomenInitial extends WomenState {}

class WomenLoading extends WomenState {}

class WomenSuccess extends WomenState {
  final List<ProductModel> womenProducts;

  WomenSuccess(this.womenProducts);

  @override
  List<Object> get props => [womenProducts];
}

class WomenFailure extends WomenState {
  final String error;

  const WomenFailure(this.error);

  @override
  List<Object> get props => [error];
}

class NavigateToWomenState extends WomenState {}
