import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos_repository/todos_repository.dart';
import 'entities/entities.dart';

class FirebaseTodosRepository implements TodosRepository{

  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    // TODO: implement addNewTodo
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    return todoCollection.document(todo.id).delete();  }

  @override
  Stream<List<Todo>> todos() {
    // TODO: implement todos
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Todo.fromEntity(TodoEntity.fromSnapShot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo update) {
    // TODO: implement updateTodo
    return todoCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}