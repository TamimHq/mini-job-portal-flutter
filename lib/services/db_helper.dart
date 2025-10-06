import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  /// Getter to access the database instance
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  /// Initialize database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "job_app.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Create tables
  Future _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    """);

    await db.execute("""
      CREATE TABLE saved_jobs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        company TEXT,
        location TEXT,
        salary TEXT
      )
    """);
  }


  /// Insert new user
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert("users", user);
  }

  /// Get user by email+password (for login)
  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    final res = await db.query(
      "users",
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    if (res.isNotEmpty) return res.first;
    return null;
  }


  /// Insert saved job
  Future<int> insertJob(Map<String, dynamic> job) async {
    final db = await database;
    return await db.insert("saved_jobs", job);
  }

  /// Get all saved jobs
  Future<List<Map<String, dynamic>>> getSavedJobs() async {
    final db = await database;
    return await db.query("saved_jobs");
  }

  /// Delete job by ID
  Future<int> deleteJob(int id) async {
    final db = await database;
    return await db.delete("saved_jobs", where: "id = ?", whereArgs: [id]);
  }

  /// Clear all jobs (optional)
  Future<int> clearJobs() async {
    final db = await database;
    return await db.delete("saved_jobs");
  }
}
