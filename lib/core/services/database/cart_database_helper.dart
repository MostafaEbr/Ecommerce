import 'package:e_comm/constants.dart';
import 'package:e_comm/model/cartproductmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {

  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  
  
  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");
    return await openDatabase(path, version: 5,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableName (
      $columnName TEXT Not Null ,
      $columnImage TEXT Not Null ,
      $columnPrice TEXT Not Null ,
      $columnQuantity INTEGER Not Null ,
      $columnProductId TEXT Not Null 
       )
      ''');
    });
  }


  Future<List<CartProductModel>> getAllProduct ()async{
    var dbHelper = await database;
    
    List<Map> maps =await dbHelper.query(tableName);

    List<CartProductModel> list = maps.isNotEmpty ?
        maps.map((product) => CartProductModel.fromJason(product)).toList():[];

    return list;
  }
  
  insert(CartProductModel cartProductModel)async
  {

    var dbClient = await database;
    await dbClient.insert(tableName, cartProductModel.toJason(),conflictAlgorithm: ConflictAlgorithm.replace);
  }


  updateProduct(CartProductModel productModel)async
  {
    var dbClient= await database;

   return await dbClient.update(tableName,
    productModel.toJason(),
      where: "$columnProductId = ?",
      whereArgs: [productModel.productId]
    );

  }



}
