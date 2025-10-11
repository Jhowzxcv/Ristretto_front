// import 'package:sqflite/sqflite.dart';

// import 'package:ristretto/core/services/database.dart';
// import 'package:ristretto/core/models/iuser.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:ristretto/core/models/isigned_in_user.dart';

import 'api.dart';

class UserService{
  static final UserService instance=UserService._constructor();
  final _storage=FlutterSecureStorage();

  // private constructor to apply singleton pattern
  UserService._constructor();

  Future<void> login({required String email,required String password})async{
    try{
      debugPrint('email: $email');
      debugPrint('password: $password');
      final response=await ApiClient.instance.dio.post('/auth/login',data:{
        'email':email,
        'password':password,
      });

      final accessToken=response.data['accessToken'];
      debugPrint(accessToken);

      await _storage.write(key:'accessToken',value:accessToken);
    }catch(err){
      rethrow;
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  })async{
    try{
      debugPrint(name);
      debugPrint(email);
      debugPrint(password);
      debugPrint('darn');
      final response=await ApiClient.instance.dio.post('/users',data:{
        'name':name,
        'email':email,
        'password':password,
      });

      debugPrint(response.data.toString());
    }catch(err){
      rethrow;
    }
  }

  Future<bool> verifyEmailExistence(String email)async{
    return false;
    // return true;
  }

  Future<IsignedInUser> getUserById(String userId)async{
    final response=await ApiClient.instance.dio.get('/users/$userId');

    IsignedInUser user=IsignedInUser(
      name:response.data['name'],
    );
  
    return user;
  }

  // // get database connection
  // Future<Database> get _database async=>await DatabaseService.instance.database;

  // // create user
  // Future<void> createUser(IUser newUser)async{
  //   final Database database=await _database;
  //   await database.insert(
  //     'User',
  //     newUser.toMap(),
  //   );
  // }

  // // get all users
  // Future<List<IUser>> getAllUsers()async{
  //   final Database database=await _database;
  //   final result=await database.query('User');

  //   return result
  //     .map((map)=>IUser.fromMap(map))
  //     .toList();
  // }

  // // check whether email already exists
  // Future<bool> verifyEmailExistence(String email)async{
  //   final Database database=await _database;
  //   final result=await database.query(
  //     'User',
  //     where:'email=?',
  //     whereArgs:[email],
  //   );

  //   return result.isNotEmpty;
  // }

  // // verify login
  // Future<bool> verifyLogin({
  //   required String email,
  //   required String password
  // })async{
  //   final Database database=await _database;
  //   final result=await database.query(
  //     'User',
  //     where:'email=? AND password=?',
  //     whereArgs:[email,password],
  //   );

  //   return result.isNotEmpty;
  // }

  // // // get user by id
  // // Future<XX> getUserById(String id)async{}
}
