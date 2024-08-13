

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/usecases/get_tasks_use_case.dart';
import 'package:todo_app/presentation/blocs/task_event.dart';
import 'package:todo_app/presentation/blocs/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase getTasksUseCase;

  TaskBloc(this.getTasksUseCase) : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      final tasks = await getTasksUseCase();
      emit(TasksLoadedState(tasks));
    });

    // Adicione eventos para adicionar, editar, excluir e marcar tarefas como concluídas.
  }
}
