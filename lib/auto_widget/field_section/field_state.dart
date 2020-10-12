part of 'field_bloc.dart';

@immutable
abstract class FieldState {}

class InitialedFieldState extends FieldState {
  final String value;

  InitialedFieldState(this.value);
}

class ChangedFieldState extends FieldState {
  final String value;

  ChangedFieldState(this.value);
}

class ErrorFieldState extends FieldState {}
