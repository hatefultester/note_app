part of 'accessibility_bloc.dart';

sealed class AccessibilityEvent {}

final class StartAccessibility extends AccessibilityEvent {}

final class RestoreAccessibility extends AccessibilityEvent {}

final class ChangeFontSize extends AccessibilityEvent {
  final double size;

  ChangeFontSize({required this.size});
}

final class ChangePriorityColor extends AccessibilityEvent {
  final NotePriority priority;
  final Color color;

  ChangePriorityColor({
    required this.priority,
    required this.color,
  });
}

final class ChangeThemeColor extends AccessibilityEvent {
  final Color color;

  ChangeThemeColor({required this.color});
}

final class SwitchThemeMode extends AccessibilityEvent {}
