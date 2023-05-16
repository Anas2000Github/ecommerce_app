import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/model/cart_product_model.dart';
import 'package:learn_flutter_with_firebase/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE ${Constants.tableCartProduct}(
      ${Constants.ColumnName} TEXT NOT NULL,
     ${Constants.ColumnImage} TEXT NOT NULL,
      ${Constants.ColumnPrice} TEXT NOT NULL, 
      ${Constants.ColumnQuantity} INTEGER NOT NULL,
      ${Constants.ColumnProductId} TEXT NOT NULL)
      ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(Constants.tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(Constants.tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  clearDatabase(CartProductModel model) async {
    var dbClient = await database;
    await dbClient?.delete(Constants.tableCartProduct,where: '${Constants.ColumnProductId}=?',whereArgs: [model.productid]);
    print('database deleted');
    print(dbClient.toString());
  }

  updateProduct(CartProductModel model)async{
    var dbClient = await database;
    return await dbClient!.update(Constants.tableCartProduct, model.toJson(),
    where: '${Constants.ColumnProductId} = ?',whereArgs: [model.productid]);

  }

}
