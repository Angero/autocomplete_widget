part of 'field_bloc.dart';

@immutable
abstract class FieldEvent {}

class InitialFieldEvent extends FieldEvent {
  final String value;

  InitialFieldEvent(this.value);
}

class ChangeFieldEvent extends FieldEvent {
  final String value;

  ChangeFieldEvent(this.value);
}
