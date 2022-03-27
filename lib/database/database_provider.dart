import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todo/database/constats.dart';
import 'package:todo/model/task.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._init();

  DatabaseProvider._init();

  static Database? _database;

  Future<Database>? get database async {
    if (_database != null) _database;
    _database = await _initDB();
    return _database!;
  }

  Future<Database>? _initDB() async {
    String path = join(await getDatabasesPath(), 'UserDatabase.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database database, int version) async {
    await database.execute('''  
    CREATE TABLE $tasktable (
    $columnId $idtype,
    $columnName $texttype,
    $columnPhone $texttype
    )
    ''');
  }

  /// CRUD

  // Update
  Future<void> updateUser(task task) async {
    final db = await instance.database;
    db!.update(
      tasktable,
      task.tomap(),
      where: '$columnId = ?',
      whereArgs: [task.id],
    );
  }

  // Create
  Future<void> createUser(task task) async {
    final db = await instance.database;
    db!.insert(
      tasktable,
      task.tomap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Delete
  Future<void> deleteUser(int? id) async {
    final db = await instance.database;
    db!.delete(
      tasktable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Read One Element
  Future<task> readOneElement(int? id) async {
    final db = await instance.database;
    final data = await db!.query(
      tasktable,
      where: '$columnId ? =',
      whereArgs: [id],
    );
    return data.isNotEmpty
        ? task.fromMap(data.first)
        : throw Exception('There is no Data');
  }

  // Read All Elements
  Future<List<task>> readAllElements() async {
    final db = await instance.database;
    final data = await db!.query(tasktable);
    return data.isNotEmpty ? data.map((e) => task.fromMap(e)).toList() : [];
  }
}
