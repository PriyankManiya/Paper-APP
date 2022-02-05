// ignore_for_file: file_names, unnecessary_null_comparison, unused_import, unused_field, unused_element, avoid_print, unnecessary_this, unused_local_variable, await_only_futures, unnecessary_new, prefer_typing_uninitialized_variables, non_constant_identifier_names, void_checks, avoid_types_as_parameter_names
import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:paper_app/helper/model/location_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_example/model/emp.dart';

class DBHelper {
  static Database _database;

  //  static int  _databaseHelper = 0;
  Future<Database> get database async {
    // ignore: prefer_conditional_assignment
    if (_database != null) {
      return _database;
    }
    _database = await initdb();
    return _database;
  }

  Future<Database> initdb() async {
    io.Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = documentdirectory.path + "test.db";
    var thedb = await openDatabase(path, version: 1, onCreate: _createdb);
    print("init");
    return thedb;
  }

  void _createdb(Database db, int newVersion) async {
    //  var id ='id';
    //  var firstname="first name";
    //  var lastname="last name";
    //  var mobileno="mobile no";
    //  var emailid="email id";
    await db.execute('''CREATE TABLE Employee(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address TEXT,
        postcode TEXT
        )
        ''');

    print("Created tables");
  }

//  Future<List<Map<String, dynamic>>>  getNotesMapList() async {
//      Database? db = await this.database;
//      //var result = await db.rawQuery('SELECT * FROM Employee');
//     var result = await db!.query('Employee');
//     return result;
//    }

  void insertEmployee(LocationModel employee) async {
    //  Database db = await this.database;
    var dbclient = await _database;
    // ignore: dead_code
    print("insert");
    await dbclient?.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Employee(address, postcode) VALUES("${employee.address}", "${employee.postcode}")');
      // 'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)'
    })?.then((value) {
      print("success");
    })?.catchError((onError) {
      print("error:::$onError");
    });
  }

  Future<void> delete (int id) async {
    final db =await database;
    int result = await db.delete("Employee", where: ' id = ?',whereArgs: [id]);
    // io.Directory documentdirectory = await getApplicationDocumentsDirectory();
    // String path = documentdirectory.path + "test.db";
    // deleteDatabase(path);
    print("Deleted");
    // print(result.bitLength);
    // return result;
  }
//   Future<int>update(emp employee) async {
//     var dbclient = await database;
//     var result=await dbclient!.update('Employee',employee.toMap(),where: 'id =?',whereArgs: [employee.id] );
//       return result;
//   }

  Future<List<LocationModel>> getEmployees() async {
    var dbclient = await database;
    List<Map> list = await dbclient.rawQuery('SELECT * FROM Employee');
    print("List ::: ${list}");
    // ignore: deprecated_member_use
    List<LocationModel> employees = [];
    for (int i = 0; i < list.length; i++) {
      employees.insert(
          0, new LocationModel(id: list[i]['id'], address: list[i]["address"], postcode: list[i]["postcode"]));
    }
    // print(employees.length);
    return employees;
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
