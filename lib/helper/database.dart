import 'package:nid_notes/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'nid_notes.db');
    return await openDatabase(path,
        version: 2,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            content TEXT NULL
          )
          ''');
  }

  Future<int> insert(Note note) async {
    return (await database)!.insert('notes', note.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return (await database)!.query('notes');
  }
}