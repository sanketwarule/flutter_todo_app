import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class TodosState extends Equatable{
  TodosState([List props = const []]) : super(props);
}

class TodosLoading extends TodosState{

  @override
  String toString() {
    // TODO: implement toString
    return 'TodosLoading';
  }
}

class TodosLoaded extends TodosState{

  final List<Todo> todos;
  TodosLoaded([this.todos = const []]): super([todos]);

  @override
  String toString() {
    // TODO: implement toString
    return 'TodosLoaded';
  }
}

class TodosNotLoaded extends TodosState{

  @override
  String toString() {
    // TODO: implement toString
    return 'TodosNotLoaded';
  }
}
