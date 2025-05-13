import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/cart-widget.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price TEXT,
        imageAsset TEXT
      )
    ''');
  }

  Future<void> insertProduct(Product product) async {
    final dbClient = await db;
    await dbClient.insert('cart', product.toMap());
  }

  Future<List<Product>> getCartItems() async {
    final dbClient = await db;
    final maps = await dbClient.query('cart');
    return maps.map((map) => Product.fromMap(map)).toList();
  }

  Future<void> clearCart() async {
    final dbClient = await db;
    await dbClient.delete('cart');
  }
}
