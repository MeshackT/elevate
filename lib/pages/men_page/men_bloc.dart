import 'package:bloc/bloc.dart';

part 'men_event.dart';
part 'men_state.dart';

class MenBloc extends Bloc<MenEvent, MenState> {
  MenBloc() : super(MenInitial()) {
    on<MenEvent>((event, emit) {
      if (event is NavigateToCart) {
        emit(NavigateToCart());
      }
    });
  }
}
