import 'package:equatable/equatable.dart';
import 'package:todos_repository/todos_repository.dart';

abstract class TodosEvent extends Equatable{
  TodosEvent([List props = const []]) : super(props);
}

class LoadTodos extends TodosEvent{
  @override
  String toString() {
    // TODO: implement toString
    return 'LoadTodos';
  }
}

class AddTodo extends TodosEvent{
  final Todo todo;
  AddTodo(this.todo) : super([todo]);

  @override
  String toString() {
    // TODO: implement toString
    return 'AddTodo {todo : $todo}';
  }
}

class UpdateTodo extends TodosEvent{
  final Todo updatedTodo;
  UpdateTodo(this.updatedTodo) : super([updatedTodo]);

  @override
  String toString() {
    // TODO: implement toString
    return 'UpdatedTodo {updatedTodo : $updatedTodo}';
  }
}

class DeleteTodo extends TodosEvent{
  final Todo todo;
  DeleteTodo(this.todo) : super([todo]);

  @override
  String toString() {
    // TODO: implement toString
    return 'DeleteTodo {deleteTodo : $todo}';
  }
}

class ClearCompleted extends TodosEvent{
  @override
  String toString() {
    // TODO: implement toString
    return 'ClearCompleted';
  }
}

class ToggleAll extends TodosEvent{
  @override
  String toString() {
    // TODO: implement toString
    return 'ToggleAll';
  }
}

class TodosUpdated extends TodosEvent{
  final List<Todo> todos;
  TodosUpdated(this.todos) : super([todos]);

  @override
  String toString() {
    // TODO: implement toString
    return 'TodosUpdated';
  }
}