part of 'bar_bloc.dart';

@immutable
sealed class AppBarJOState {}

final class BarInitial extends AppBarJOState {}

final class AppBarJOChangedState extends AppBarJOState {
  final int activeIndex;
  AppBarJOChangedState(this.activeIndex);
}
