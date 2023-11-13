import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:math_app/model/player.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'math_app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE leaderboard(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            score INTEGER,
            lastUpdate INTEGER
          )
        ''');
      },
    );
  }

  static Future<void> insertPlayer(Player player) async {
    final Database db = await database;

    // Thêm người chơi mới
    await db.insert(
      'leaderboard',
      player.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Lấy danh sách xếp hạng theo thứ tự giảm dần
    List<Map<String, dynamic>> leaderboard = await getLeaderboard();

    // Nếu danh sách có hơn 10 người chơi, xóa người chơi thứ 10
    if (leaderboard.length > 10) {
      final int tenthScore = await getTenthScore();
      await db.delete(
        'leaderboard',
        where: 'score = ?',
        whereArgs: [tenthScore],
      );
    }
  }

  static Future<Player?> getPlayerByName(String playerName) async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'leaderboard',
      where: 'name = ?',
      whereArgs: [playerName],
    );

    if (result.isNotEmpty) {
      return Player.fromMap(result.first);
    } else {
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> getLeaderboard() async {
    final Database db = await database;
    return await db.query(
      'leaderboard',
      orderBy: 'score DESC',
      limit: 10,
    );
  }

  static Future<int> getHighestScore() async {
    final Database db = await database;
    final result = await db.query(
      'leaderboard',
      orderBy: 'score DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first['score'] as int;
    } else {
      return 0;
    }
  }

  static Future<int> getTenthScore() async {
    final Database db = await database;
    final result = await db.query(
      'leaderboard',
      orderBy: 'score DESC',
      limit: 1,
      offset: 9,
    );

    if (result.isNotEmpty) {
      return result.first['score'] as int;
    } else {
      return 0;
    }
  }

  static Future<Player?> getPlayerAtRank(int rank) async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'leaderboard',
      orderBy: 'score DESC',
      limit: 1,
      offset: rank - 1,
    );

    if (result.isNotEmpty) {
      return Player.fromMap(result.first);
    } else {
      return null;
    }
  }
}
