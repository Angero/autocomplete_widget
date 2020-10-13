import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/auto_widget/auto_model.dart';

part 'field_event.dart';

part 'field_state.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  final List<AutoModel> list;

  FieldBloc(this.list);

  @override
  FieldState get initialState => InitialedFieldState('');

  @override
  Stream<FieldState> mapEventToState(FieldEvent event) async* {
    if (event is InitialFieldEvent) {
      yield InitialedFieldState(event.value);
    }

    if (event is ChangeFieldEvent) {
      if (event.value.isNotEmpty) {
        List<AutoModel> _list = this
            .list
            .where((AutoModel autoModel) => autoModel.value
                .toLowerCase()
                .contains(event.value.toLowerCase()))
            .toList();
        if (_list.length == 1 &&
            _list.elementAt(0).value.toLowerCase() == event.value.toLowerCase())
          yield InitialedFieldState(_list.elementAt(0).value);
        else
          yield ChangedFieldState(event.value);
      } else {
        yield ErrorFieldState();
      }
    }
  }
}
