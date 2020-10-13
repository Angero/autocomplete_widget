import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auto_event.dart';

part 'auto_state.dart';

class AutoBloc extends Bloc<AutoEvent, AutoState> {
  @override
  AutoState get initialState => FetchedAutoState(null);

  @override
  Stream<AutoState> mapEventToState(AutoEvent event) async* {
    if (event is FetchAutoEvent) {
      yield FetchedAutoState(event.id);
    } else if (event is EraseAutoEvent) {
      yield FetchedAutoState(null);
    }
  }
}
