import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/auto_widget/auto_model.dart';
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
            widgets.add(_itemWidget(autoModel));
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

  Widget _itemWidget(AutoModel autoModel) {
    return Container(
      height: 48.0,
      child: InkWell(
        child: Text(autoModel.value),
        onTap: () {
          print(autoModel.id.toString());
        },
      ),
    );
  }
}
