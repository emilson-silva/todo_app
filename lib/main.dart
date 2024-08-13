import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/usecases/get_tasks_use_case.dart';
import 'package:todo_app/presentation/pages/todo_page.dart';
import 'package:todo_app/presentation/blocs/task_bloc.dart';
import 'package:todo_app/data/repositories/task_repository_impl.dart'; // Importe o TaskRepositoryImpl

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final taskRepository = TaskRepositoryImpl();

     final getTasksUseCase = GetTasksUseCase(taskRepository);

    return BlocProvider(
      create: (context) => TaskBloc(getTasksUseCase),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoPage(),
      ),
    );
  }
}
