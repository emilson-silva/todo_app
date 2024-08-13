import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/domain/entities/task_entitie.dart';
import 'package:todo_app/domain/repositories/task_repository.dart';
import 'package:path/path.dart';

class TaskRepositoryImpl implements TaskRepository {
  late Database db;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'todo_app.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute('''
          CREATE TABLE Tasks (
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  @override
  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> maps = await db.query('Tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  @override
  Future<void> addTask(Task task) async {
    await db.insert('Tasks', {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'isCompleted': task.isCompleted ? 1 : 0,
    });
  }

  @override
  Future<void> updateTask(Task task) async {
    await db.update(
      'Tasks',
      {
        'title': task.title,
        'description': task.description,
        'isCompleted': task.isCompleted ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<void> deleteTask(String id) async {
    await db.delete(
      'Tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> markTaskAsCompleted(String id) async {
    await db.update(
      'Tasks',
      {
        'isCompleted': 1,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
