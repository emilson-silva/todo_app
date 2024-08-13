

import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/task_entitie.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TasksLoadedState extends TaskState {
  final List<Task> tasks;

  const TasksLoadedState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

// Crie estados para refletir diferentes fases do ciclo de vida do aplicativo.
