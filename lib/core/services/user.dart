import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ristretto/core/services/database.dart';
import 'package:ristretto/core/models/iuser.dart';

class UserService{
  static final UserService instance=UserService._constructor();

  // private constructor to apply singleton pattern
  UserService._constructor();

  // get database connection
  Future<Database> get _database async=>await DatabaseService.instance.database;

  // create user
  Future<void> createUser(IUser newUser)async{
    final Database database=await _database;
    await database.insert(
      'User',
      newUser.toMap(),
    );
  }

  // get all users
  Future<List<IUser>> getAllUsers()async{
    final Database database=await _database;
    final result=await database.query('User');

    return result
      .map((map)=>IUser.fromMap(map))
      .toList();
  }

  // check whether email already exists
  Future<bool> verifyEmailExistence(String email)async{
    final Database database=await _database;
    final result=await database.query(
      'User',
      where:'email=?',
      whereArgs:[email],
    );

    return result.isNotEmpty;
  }

  // verify login
  Future<bool> verifyLogin({
    required String email,
    required String password
  })async{
    final Database database=await _database;
    final result=await database.query(
      'User',
      where:'email=? AND password=?',
      whereArgs:[email,password],
    );

    return result.isNotEmpty;
  }

  // // get user by id
  // Future<XX> getUserById(String id)async{}
}
