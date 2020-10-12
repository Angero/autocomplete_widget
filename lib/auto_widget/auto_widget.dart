import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/field_section/field_widget.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_widget.dart';

class AutoWidget extends StatelessWidget {
  final List<AutoModel> autoList;

  const AutoWidget({Key key, this.autoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    FieldBloc fieldBloc = FieldBloc();
    // ignore: close_sinks
    ListBloc listBloc = ListBloc(autoList);
    return MultiBlocProvider(
      providers: [
        BlocProvider<FieldBloc>(
          create: (context) => fieldBloc,
        ),
        BlocProvider<ListBloc>(
          create: (context) => listBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FieldBloc, FieldState>(
            bloc: fieldBloc,
            listener: (context, state) {
              if (state is ChangedFieldState)
                listBloc.add(FilterListEvent(state.value));
              else
                listBloc.add(FilterListEvent(''));
            },
          ),
        ],
        child: _buildColumn(),
      ),
    );
  }

  Column _buildColumn() {
    return Column(
      children: [
        FieldWidget(),
        SizedBox(height: 8.0),
        ListWidget(),
      ],
    );
  }
}
