part of 'field_bloc.dart';

@immutable
abstract class FieldEvent {}

class ChangeFieldEvent extends FieldEvent {
  final String value;

  ChangeFieldEvent(this.value);
}
