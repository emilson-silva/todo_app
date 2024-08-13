import 'package:todo_app/domain/entities/task_entitie.dart';
import 'package:todo_app/domain/repositories/task_repository.dart';

class GetTasksUseCase{
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}