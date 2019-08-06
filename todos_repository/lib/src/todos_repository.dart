import '../todos_repository.dart';

abstract class TodosRepository{

  Future<void> addNewTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<void> updateTodo(Todo update);

  Stream<List<Todo>> todos();
}