import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

class FieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    FieldBloc fieldBloc = BlocProvider.of<FieldBloc>(context);
    return BlocBuilder<FieldBloc, FieldState>(
        bloc: fieldBloc,
        builder: (BuildContext context, FieldState fieldState) {
          return TextField(
            // initialValue: (fieldState is InitialedFieldState)
            //     ? fieldState.value
            //     : ,
            // controller: TextEditingController(
            //     text: (fieldState is InitialedFieldState)
            //         ? fieldState.value
            //         : null),
            decoration: InputDecoration(
                errorText: fieldState is ErrorFieldState ? 'Error' : null),
            onChanged: (value) {
              fieldBloc.add(ChangeFieldEvent(value));
              BlocProvider.of<ListBloc>(context).add(FilterListEvent(value));
            },
          );
        });
  }
}
