part of 'bar_bloc.dart';

@immutable
sealed class AppBarJOEvent {}

final class AppBarScrollEvent extends AppBarJOEvent {
  final int activeIndex;
  AppBarScrollEvent(this.activeIndex);
}

// ----

@immutable
sealed class FloatingMessengerBarJOEvent {}

final class FloatingMessengerToggleBarJOEvent
    extends FloatingMessengerBarJOEvent {
  FloatingMessengerToggleBarJOEvent();
}
