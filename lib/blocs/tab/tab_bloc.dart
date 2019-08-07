import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/blocs/tab/tab_event.dart';
import 'package:flutter_todo_app/models/app_tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.todos;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}