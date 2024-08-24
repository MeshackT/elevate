import 'package:bloc/bloc.dart';

part 'detailed_product_event.dart';
part 'detailed_product_state.dart';

class DetailedProductBloc
    extends Bloc<DetailedProductEvent, DetailedProductState> {
  DetailedProductBloc() : super(DetailedProductInitial()) {
    on<DetailedProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
