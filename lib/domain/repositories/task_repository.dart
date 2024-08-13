

import 'package:todo_app/domain/entities/task_entitie.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
  Future<void> markTaskAsCompleted(String id);
}
