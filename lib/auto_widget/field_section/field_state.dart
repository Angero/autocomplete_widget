part of 'field_bloc.dart';

@immutable
abstract class FieldState {}

class ChangingFieldState extends FieldState {}

class ChangedFieldState extends FieldState {
  final String value;

  ChangedFieldState(this.value);

}

class ErrorFieldState extends FieldState {}
