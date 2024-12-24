part of 'bar_bloc.dart';

@immutable
sealed class AppBarJOEvent {}

final class AppBarScrollEvent extends AppBarJOEvent {
  final int activeIndex;
  AppBarScrollEvent(this.activeIndex);
}
