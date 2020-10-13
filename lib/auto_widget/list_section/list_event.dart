part of 'list_bloc.dart';

@immutable
abstract class ListEvent {}

class FilterListEvent extends ListEvent {
  final String filterValue;

  FilterListEvent(this.filterValue);
}

