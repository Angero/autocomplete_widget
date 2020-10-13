part of 'auto_bloc.dart';

@immutable
abstract class AutoEvent {}

class EraseAutoEvent extends AutoEvent {}

class FetchAutoEvent extends AutoEvent {
  final int id;

  FetchAutoEvent(this.id);
}
