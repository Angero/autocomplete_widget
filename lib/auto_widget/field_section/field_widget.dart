import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_bloc.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

class FieldWidget extends StatelessWidget {
  final TextEditingController fieldController;

  const FieldWidget({Key key, this.fieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    AutoBloc autoBloc = BlocProvider.of<AutoBloc>(context);
    // ignore: close_sinks
    FieldBloc fieldBloc = BlocProvider.of<FieldBloc>(context);
    // ignore: close_sinks
    ListBloc listBloc = BlocProvider.of<ListBloc>(context);
    return BlocBuilder<FieldBloc, FieldState>(
        bloc: fieldBloc,
        builder: (BuildContext context, FieldState fieldState) {
          if (fieldState is InitialedFieldState)
            fieldController.text = fieldState.value;
          return TextField(
            controller: fieldController,
            decoration: InputDecoration(
                errorText: fieldState is ErrorFieldState ? 'Error' : null),
            onChanged: (value) {
              fieldBloc.add(ChangeFieldEvent(value));
              listBloc.add(FilterListEvent(value));
              autoBloc.add(
                  CompareAutoEvent(fieldBloc: fieldBloc, listBloc: listBloc));
            },
          );
        });
  }
}
