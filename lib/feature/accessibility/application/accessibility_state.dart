part of 'accessibility_bloc.dart';

abstract class AccessibilityState {}

class AccessibilityInitial extends AccessibilityState {}

class AccessibilityLoading extends AccessibilityState {}

class AccessibilityLoaded extends AccessibilityState {
  final AccessibilityEntity entity;

  AccessibilityLoaded({required this.entity});
}

class AccessibilityError extends AccessibilityState {
  final String message;

  AccessibilityError({required this.message});
}
