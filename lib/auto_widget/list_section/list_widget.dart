import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_bloc.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

class ListWidget extends StatelessWidget {
  final TextEditingController fieldController;

  const ListWidget({Key key, this.fieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    AutoBloc autoBloc = BlocProvider.of<AutoBloc>(context);
    // ignore: close_sinks
    FieldBloc fieldBloc = BlocProvider.of<FieldBloc>(context);
    // ignore: close_sinks
    ListBloc listBloc = BlocProvider.of<ListBloc>(context);
    return BlocBuilder<ListBloc, ListState>(
        bloc: listBloc,
        builder: (BuildContext context, ListState listState) {
          if (listState is HiddenListState) return Container();
          List<Widget> widgets = List();
          for (AutoModel autoModel in (listState as FilteredListState).list)
            widgets.add(_itemWidget(
              context: context,
              autoBloc: autoBloc,
              fieldBloc: fieldBloc,
              listBloc: listBloc,
              autoModel: autoModel,
              fieldController: fieldController,
            ));
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            height: 200.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: widgets,
              ),
            ),
          );
        });
  }

  Widget _itemWidget(
      {BuildContext context,
      AutoBloc autoBloc,
      FieldBloc fieldBloc,
      ListBloc listBloc,
      AutoModel autoModel,
      TextEditingController fieldController}) {
    return Container(
      height: 48.0,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(autoModel.value),
              Expanded(child: Container(), flex: 1),
            ],
          ),
        ),
        onTap: () {
          BlocProvider.of<FieldBloc>(context)
              .add(InitialFieldEvent(autoModel.value));
          BlocProvider.of<ListBloc>(context)
              .add(FilterListEvent(autoModel.value));
          autoBloc.add(CompareAutoEvent(
              fieldBloc: fieldBloc,
              listBloc: listBloc,
              value: autoModel.value));
        },
      ),
    );
  }
}
