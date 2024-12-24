import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'bar_event.dart';
part 'bar_state.dart';

class AppBarJOBloc extends Bloc<AppBarJOEvent, AppBarJOState> {
  int? activeIndex;

  AppBarJOBloc() : super(BarInitial()) {
    on<AppBarJOEvent>((event, emit) {
      if (event is AppBarScrollEvent) {
        activeIndex = event.activeIndex;
        emit(AppBarJOChangedState(event.activeIndex));
      }
    });
  }
}
