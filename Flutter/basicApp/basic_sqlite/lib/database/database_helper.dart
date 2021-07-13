import 'dart:io';

import 'package:basic_sqlite/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DataBaseHelper {
  static final table_name = 'ios_device_info';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';


  // make this a singleton class
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await  _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'ios_device_info.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table_name ($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnAge INTEGER)''');
  }

  // Define a function that inserts dogs into the database
  Future<void> insert(Dog dog) async {
    // Get a reference to the database.
    Database db = await instance.database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      table_name,
      dog.toJsonWith(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    Database db = await instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(table_name);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    Database db = await instance.database;

    // Update the given Dog.
    await db.update(
      table_name,
      dog.toJsonWith(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    Database db = await instance.database;

    // Remove the Dog from the database.
    await db.delete(
      table_name,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}