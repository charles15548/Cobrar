import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHandler {
  static final SqliteHandler instance = SqliteHandler._init();
  static Database? _database;

  SqliteHandler._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'pagos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            tipo_pago TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE pagos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            clienteId INTEGER NOT NULL,
            mes TEXT NOT NULL,
            monto REAL NOT NULL,
            FOREIGN KEY (clienteId) REFERENCES clientes (id)
          )
        ''');
      },
    );
  }

  // 🔥 **Método que estaba faltando**
  Future<List<Map<String, dynamic>>> getClientes() async {
    final db = await database;
    return await db.query('clientes');
  }

  // 🔥 **Método para obtener el monto de un mes**
  Future<double> getMonto(int clienteId, String mes) async {
    final db = await database;
    final result = await db.query(
      'pagos',
      where: 'clienteId = ? AND mes = ?',
      whereArgs: [clienteId, mes],
    );

    if (result.isNotEmpty) {
      return result.first['monto'] as double;
    }
    return 0.0;
  }

  // 🔥 **Método para agregar pago a un mes**
  Future<void> agregarPagoMes(int clienteId, String mes, double monto) async {
    final db = await database;
    await db.insert(
      'pagos',
      {'clienteId': clienteId, 'mes': mes, 'monto': monto},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
