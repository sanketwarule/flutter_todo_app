import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/blocs/blocs.dart';
import 'package:flutter_todo_app/blocs/stats/stats.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState>{
  StreamSubscription _todosSubscription;

  StatsBloc({@required TodosBloc todosBloc}) : assert(todosBloc != null){
    _todosSubscription = todosBloc.state.listen((state){
      if(state is TodosLoaded){
        dispatch(UpdateStats(state.todos));
      }
    });
  }

  @override
  // TODO: implement initialState
  StatsState get initialState => StatsLoading();

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async*{
    // TODO: implement mapEventToState

    if (event is UpdateStats) {
      int numActive = event.todos.where((todo) => !todo.complete).toList().length;
      int numCompleted = event.todos.where((todo) => todo.complete).toList().length;
      yield StatsLoaded(numActive, numCompleted);
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _todosSubscription?.cancel();
    super.dispose();
  }

}