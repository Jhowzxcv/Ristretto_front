import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:ristretto/core/models/iuser.dart';
import 'package:ristretto/core/services/api_client.dart';

// Centralize API calls regarding User
class UserService{
  // Singleton Pattern
  static final UserService instance=UserService._constructor();
  UserService._constructor();

  final _storage=FlutterSecureStorage();

  // Login
  Future<void> login({
    required String email,
    required String password
  })async{
    debugPrint('email: $email');
    debugPrint('password: $password');
    // Delay on Purpose (delete after)
    await Future.delayed(Duration(seconds:3));

    try{
      final response=await ApiClient.instance.dio.post(
        '/login',
        data:{
          'email':email,
          'password':password,
        },
      );

      // Obtaining and Storing Access Token locally
      final accessToken=response.data['token'];
      await _storage.write(
        key:'accessToken',
        value:accessToken,
      );
    }catch(error){
      rethrow;
    }
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  })async{
    // Delay on Purpose (delete after)
    await Future.delayed(Duration(seconds:3));

    try{
      await ApiClient.instance.dio.post(
        '/user',
        data:{
          'name':name,
          'email':email,
          'password':password,
        },
      );
    }catch(error){
      return false;
    }

    return true;
  }

  // Change later
  Future<bool> verifyEmailExistence(String email)async=>false;

  // Get User by Id
  Future<IUser> getUserById(String userId)async{
    final response=await ApiClient.instance.dio.get('/users/$userId');
    final data=response.data;

    final IUser user=IUser(
      name:data['name'],
    );
  
    return user;
  }
}
