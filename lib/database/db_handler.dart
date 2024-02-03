import 'package:path/path.dart';
import 'package:smartcado/database/database_schema.dart';
import 'package:sqflite/sqflite.dart';

/// DatabaseHandler it's a class to handle all database requests and
/// persist data on SQLite, before sync with whatever service we'll use
class DatabaseHandler {
  final String dbName = 'mart.sqlite';
  final int dbVersion = 1;

  /// Returns a connection to our database, allowing CRUD operations and
  /// data manipulation. Here we're using
  setupDatabase({String? path}) async => openDatabase(
        path ?? await _getDatabasePath(),
        onCreate: _manageCreation,
        onUpgrade: _manageUpgrade,
        version: dbVersion,
      );

  getDatabase({String? path}) async => openDatabase(
        path ?? await _getDatabasePath(),
        version: dbVersion,
      );

  Future<String> _getDatabasePath() async =>
      join(await getDatabasesPath(), dbName);

  /// Manage database creation when app it's running from first time
  /// We'll create all databases based on [DatabaseSchema] class and
  /// each database enum structure.
  _manageCreation(Database db, int version) =>
      DatabaseSchema.databaseSchema.forEach((table, fields) {
        String queryColumns = "";

        // Create columns declarations from schema
        fields.forEach((key, value) => queryColumns += "$key $value,");

        // Remove last comma from columns declarations
        queryColumns = queryColumns.substring(0, queryColumns.length - 1);

        // Create our table right on
        db.execute("CREATE TABLE $table ($queryColumns); ");
      });

  /// Manages our database upgrade. It means that every time we open Mart
  /// we'll invoke this function and, if current database version differs
  /// from app database version, an upgrade must be made
  _manageUpgrade(Database db, int oldVersion, int newVersion) => null;
}
