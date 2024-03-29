import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// singleton class to manage the database
class DataBaseProvider {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "quicksnap.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  static final DataBaseProvider _singleton = new DataBaseProvider._internal();

  factory DataBaseProvider() {
    return _singleton;
  }

  DataBaseProvider._internal();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database", _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE business_card(
                    id INTEGER PRIMARY KEY,
                    business_card_image_url TEXT,
                    business_name TEXT,
                    client_name   TEXT,
                    role          TEXT,
                    phone_number  TEXT,
                    email         TEXT,
                    web_url       TEXT,
                    address       TEXT
                )
              ''');
  }
}
