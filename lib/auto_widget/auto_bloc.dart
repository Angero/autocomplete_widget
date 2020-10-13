import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

part 'auto_event.dart';

part 'auto_state.dart';

class AutoBloc extends Bloc<AutoEvent, AutoState> {
  final FieldBloc fieldBloc;
  final ListBloc listBloc;

  AutoBloc({this.fieldBloc, this.listBloc});

  @override
  AutoState get initialState => FetchedAutoState(null);

  @override
  Stream<AutoState> mapEventToState(AutoEvent event) async* {
    if (event is CompareAutoEvent) {
      if (this.fieldBloc.state is ChangedFieldState && this.listBloc.state is FilteredListState) {
        print('text');
      }
    }
    if (event is FetchAutoEvent) {
      yield FetchedAutoState(event.id);
    } else if (event is EraseAutoEvent) {
      yield FetchedAutoState(null);
    }
  }
}
