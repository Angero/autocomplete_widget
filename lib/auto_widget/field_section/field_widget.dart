import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

class FieldWidget extends StatelessWidget {
  final TextEditingController fieldController;

  const FieldWidget({Key key, this.fieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    FieldBloc fieldBloc = BlocProvider.of<FieldBloc>(context);
    return BlocBuilder<FieldBloc, FieldState>(
        bloc: fieldBloc,
        builder: (BuildContext context, FieldState fieldState) {
          return TextField(
            controller: fieldController,
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
