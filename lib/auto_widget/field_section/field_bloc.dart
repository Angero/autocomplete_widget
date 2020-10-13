import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'field_event.dart';

part 'field_state.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  FieldBloc();

  @override
  FieldState get initialState => InitialedFieldState('');

  @override
  Stream<FieldState> mapEventToState(FieldEvent event) async* {
    if (event is InitialFieldEvent) {
      yield InitialedFieldState(event.value);
    }

    if (event is ChangeFieldEvent) {
      if (event.value.isNotEmpty)
        yield ChangedFieldState(event.value);
      else
        yield ErrorFieldState();
    }

  }
}
