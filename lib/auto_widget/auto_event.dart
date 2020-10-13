part of 'auto_bloc.dart';

@immutable
abstract class AutoEvent {}

class CompareAutoEvent extends AutoEvent {
  final FieldBloc fieldBloc;
  final ListBloc listBloc;

  CompareAutoEvent({@required this.fieldBloc, @required this.listBloc});
}

class EraseAutoEvent extends AutoEvent {}

class FetchAutoEvent extends AutoEvent {
  final int id;

  FetchAutoEvent(this.id);
}
