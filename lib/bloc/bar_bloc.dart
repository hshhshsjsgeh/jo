import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bar_event.dart';
part 'bar_state.dart';

class BarBloc extends Bloc<BarEvent, BarState> {
  BarBloc() : super(BarInitial()) {
    on<BarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
