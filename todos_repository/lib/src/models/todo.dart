import 'package:meta/meta.dart';

import '../entities/entities.dart';

@immutable
class Todo{
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task,{this.complete = false, String note = '', String id})
      : this.note = note ?? '',
        this.id = id;


  Todo copyWith({bool complete, String id, String note, String task}){
    return Todo(task ?? this.task,
        complete: complete ?? this.complete,
        note: note ?? this.note,
        id: id ?? this.id);
  }


  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id }';
  }


  @override
  // TODO: implement hashCode
  int get hashCode => complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo &&
              runtimeType == other.runtimeType &&
              complete == other.complete &&
              task == other.task &&
              note == other.note &&
              id == other.id;


  TodoEntity toEntity() {
    return TodoEntity(id, task, complete, note);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      complete: entity.complete ?? false,
      note: entity.note,
      id: entity.id,
    );
  }

}