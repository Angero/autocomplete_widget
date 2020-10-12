part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class FilteredListState extends ListState {
  final List<AutoModel> list;

  FilteredListState(this.list);
}
