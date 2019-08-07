import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/blocs/blocs.dart';
import 'package:flutter_todo_app/models/models.dart';
import 'package:flutter_todo_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Firestore Todos'),
            actions: [
//              FilterButton(visible: activeTab == AppTab.todos),
//              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addTodo');
            },
            child: Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}