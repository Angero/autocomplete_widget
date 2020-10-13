import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

part 'auto_event.dart';

part 'auto_state.dart';

class AutoBloc extends Bloc<AutoEvent, AutoState> {
  final Function(int) onChoice;

  AutoBloc({this.onChoice});

  @override
  AutoState get initialState => FetchedAutoState(null);

  @override
  Stream<AutoState> mapEventToState(AutoEvent event) async* {
    int result;
    if (event is CompareAutoEvent && event.value.isNotEmpty) {
      List<AutoModel> _list = event.listBloc.list
          .where((AutoModel autoModel) =>
              autoModel.value.toLowerCase().contains(event.value.toLowerCase()))
          .toList();
      if (_list.length == 1 &&
          _list.elementAt(0).value.toLowerCase() == event.value.toLowerCase()) {
        result = _list.elementAt(0).id;
        onChoice(result);
      }
      print(result == null ? 'null' : 'success');
      yield FetchedAutoState(result);
    }
  }
}
