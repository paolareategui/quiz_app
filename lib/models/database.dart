import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quiz_app/models/user.dart';

class DataBase {
  Future<Database> initialisedDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY , name TEXT NOT NULL, score INTEGER NOT NULL)",
        );
      },
    );
  }

  // Define a function that inserts users into the database
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await initialisedDatabase();

    // Insert the User into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same user is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<User>> users() async {
    // Get a reference to the database.
    final db = await initialisedDatabase();

    // Query the table for all the users
    final List<Map<String, Object?>> userMaps = await db.query('users');

    // Convert the list of each user's fields into a list of `User` objects.
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'score': score as int,
          } in userMaps)
        User(id: id, name: name, score: score),
    ];
  }
}

   //   // Avoid errors caused by flutter upgrade.
// // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
// // Open the database and store the reference.

//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'users_database.db'),
//     // When the database is first created, create a table to store users.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, score INTEGER)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );

  // Create a User and add it to the users table
  // var paola = User(
  //   id: 0,
  //   name: 'Paola',
  //   score: 35,
  // );

  // var teresa = User(
  //   id: 1,
  //   name: 'Teresa',
  //   score: 44,
  // );

  // await insertUser(paola);
  // await insertUser(teresa);

  // var currentUser = [];

  // currentUser = await users();

  // // Now, use the method above to retrieve all the users.
  // print(await users()); // Prints a list that include Paola.

  // print("currentUser: $currentUser");
