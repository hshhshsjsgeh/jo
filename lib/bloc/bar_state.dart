part of 'bar_bloc.dart';

@immutable
sealed class AppBarJOState {}

final class AppBarJOInitial extends AppBarJOState {}

final class AppBarJOChangedState extends AppBarJOState {
  final int activeIndex;
  AppBarJOChangedState(this.activeIndex);
}

// ----

@immutable
sealed class FloatingMessengerBarJOState {}

final class FloatingMessengerBarJOInitial extends FloatingMessengerBarJOState {
  final bool toggled;
  FloatingMessengerBarJOInitial(this.toggled);
}

final class FloatingMessengerBarJOChangedState
    extends FloatingMessengerBarJOState {
  final bool toggled;
  FloatingMessengerBarJOChangedState(this.toggled);
}
