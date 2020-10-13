part of 'auto_bloc.dart';

@immutable
abstract class AutoState {}

class AutoInitial extends AutoState {}

class FetchedAutoState extends AutoState {
  final int id;

  FetchedAutoState(this.id);
}
