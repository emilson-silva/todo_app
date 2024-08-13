
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class LoadTasksEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}

