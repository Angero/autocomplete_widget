import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/auto_widget/auto_model.dart';

part 'list_event.dart';

part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final List<AutoModel> list;

  ListBloc(this.list);

  @override
  ListState get initialState => HiddenListState();

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    if (event is FilterListEvent) {
      if (event.filterValue.isNotEmpty) {
      List<AutoModel> _list = this
          .list
          .where((AutoModel autoModel) => autoModel.value
              .toLowerCase()
              .contains(event.filterValue.toLowerCase()))
          .toList();
      if (_list.length > 0)
        yield FilteredListState(_list);
      else
        yield HiddenListState();
      } else {
        yield HiddenListState();
      }
    }
  }
}
