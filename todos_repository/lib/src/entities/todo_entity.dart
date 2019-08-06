import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable{
  final bool complete;
  final String id;
  final String note;
  final String task;

  TodoEntity(this.id,this.task,this.complete,this.note);

  Map<String, Object> toJson(){
    return {
      'complete' : complete,
      'id' : id,
      'note' : note,
      'task' : task,
    };
  }

  static TodoEntity fromJson(Map<String,Object> json){
    return TodoEntity(
        json['id'] as String,
        json['task'] as String,
        json['complete'] as bool,
        json['note'] as String);
  }

  static TodoEntity fromSnapShot(DocumentSnapshot snapshot){
    return TodoEntity(
      snapshot.documentID,
      snapshot.data['task'],
      snapshot.data['complete'],
      snapshot.data['note']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
    };
  }


}