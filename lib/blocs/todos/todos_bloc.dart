import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todo_app/blocs/todos/todos.dart';
import 'package:todos_repository/todos_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState>{
  final TodosRepository _todosRepository;
  StreamSubscription _todosSubscription;

  TodosBloc({@required TodosRepository todosRepository})
      : assert (todosRepository != null),
        _todosRepository = todosRepository;


  @override
  // TODO: implement initialState
  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async*{
    // TODO: implement mapEventToState

    if (event is LoadTodos){
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo){
      yield* _mapAddTodoToState(event);
    } else if (event is DeleteTodo){
      yield* _mapDeleteTodoToState(event);
    } else if (event is UpdateTodo){
      yield* _mapUpdateTodoToState(event);
    } else if (event is ClearCompleted){
      yield* _mapClearCompletedToState();
    } else if (event is ToggleAll){
      yield* _mapToggleAllToState();
    } else if (event is TodosUpdated){
      yield* _mapTodosUpdateToState(event);
    }
  }


  Stream<TodosState> _mapLoadTodosToState() async* {
    _todosSubscription?.cancel();
    _todosSubscription = _todosRepository.todos().listen((todos) {
        dispatch(
          TodosUpdated(todos),
        );
      },
    );
  }

  Stream<TodosState> _mapAddTodoToState(AddTodo event) async*{
    _todosRepository.addNewTodo(event.todo);
  }

  Stream<TodosState> _mapUpdateTodoToState(UpdateTodo event) async* {
    _todosRepository.updateTodo(event.updatedTodo);
  }

  Stream<TodosState> _mapDeleteTodoToState(DeleteTodo event) async* {
    _todosRepository.deleteTodo(event.todo);
  }

  Stream<TodosState> _mapToggleAllToState() async* {
    final state = currentState;
    if (state is TodosLoaded) {
      final allComplete = state.todos.every((todo) => todo.complete);
      final List<Todo> updatedTodos = state.todos
          .map((todo) => todo.copyWith(complete: !allComplete))
          .toList();
      updatedTodos.forEach((updatedTodo) {
        _todosRepository.updateTodo(updatedTodo);
      });
    }
  }

  Stream<TodosState> _mapClearCompletedToState() async* {
    final state = currentState;
    if (state is TodosLoaded) {
      final List<Todo> completedTodos =
      state.todos.where((todo) => todo.complete).toList();
      completedTodos.forEach((completedTodo) {
        _todosRepository.deleteTodo(completedTodo);
      });
    }
  }


  /*
  *
  * When we load our todos, we are subscribing to the TodosRepository and every time a
  * new todoo comes in, we dispatch a TodosUpdated event.
   * We then handle all TodosUpdates via: _mapTodosUpdateToState() method
  *
  * */

  Stream<TodosState> _mapTodosUpdateToState(TodosUpdated event) async* {
    yield TodosLoaded(event.todos);
  }

  @override
  void dispose() {
    _todosSubscription?.cancel();
    super.dispose();
  }
}