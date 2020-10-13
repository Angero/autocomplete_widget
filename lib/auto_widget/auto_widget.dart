import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_bloc.dart';
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
    AutoBloc autoBloc = AutoBloc();
    // ignore: close_sinks
    FieldBloc fieldBloc = FieldBloc();
    // ignore: close_sinks
    ListBloc listBloc = ListBloc(autoList);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AutoBloc>(
          create: (context) => autoBloc,
        ),
        BlocProvider<FieldBloc>(
          create: (context) => fieldBloc,
        ),
        BlocProvider<ListBloc>(
          create: (context) => listBloc,
        ),
      ],
      child: _buildColumn(),
    );
  }

  Column _buildColumn() {
    TextEditingController fieldController = TextEditingController();
    return Column(
      children: [
        FieldWidget(fieldController: fieldController),
        SizedBox(height: 8.0),
        ListWidget(fieldController: fieldController),
      ],
    );
  }
}
