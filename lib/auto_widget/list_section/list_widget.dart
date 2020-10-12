import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
import 'package:untitled4/auto_widget/field_section/field_bloc.dart';
import 'package:untitled4/auto_widget/list_section/list_bloc.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ListBloc listBloc = BlocProvider.of<ListBloc>(context);
    return BlocBuilder<ListBloc, ListState>(
        bloc: listBloc,
        builder: (BuildContext context, ListState listState) {
          if (listState is HiddenListState) return Container();
          List<Widget> widgets = List();
          for (AutoModel autoModel in (listState as FilteredListState).list)
            widgets.add(_itemWidget(context, autoModel));
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

  Widget _itemWidget(BuildContext context, AutoModel autoModel) {
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
              .add(ChangeFieldEvent(autoModel.value));
        },
      ),
    );
  }
}
