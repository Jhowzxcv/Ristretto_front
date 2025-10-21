import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:ristretto/core/models/icategory.dart';

import 'package:ristretto/core/themes/colors.dart';
import 'package:ristretto/core/services/api_client.dart';

// Centralize API calls regarding Category
class CategoryService{
  // Singleton pattern
  static final CategoryService instance=CategoryService._constructor();
  CategoryService._constructor();

  final _storage=FlutterSecureStorage();

  // Create Category for Authenticated User
  Future<void> create({
    required name,
    required ListColor listColor,
  })async{
    String rgbHex = '#${listColor.color.value.toRadixString(16).substring(2).toUpperCase()}';
    debugPrint(rgbHex);
    await Future.delayed(Duration(seconds:3));
    final accessToken=await _storage.read(key:'accessToken');

    if(accessToken==null){
      debugPrint('no access token');
      return;
    }

    debugPrint('CREATE CATEGORY.DART: '+accessToken);

    try{
      await ApiClient.instance.dio.post(
        '/categories',
        data:{
          'name':name,
          'color':rgbHex,
        },
        options:Options(
          headers:{
            'authorization':'Bearer $accessToken',
          },
        ),
      );
    }catch(error){
      debugPrint('could not create a new list: '+error.toString());
    }
  }

  // Get categories of Authenticated User
  Future<List<ICategory>> getCategories()async{
    await Future.delayed(Duration(seconds:3));
    final accessToken=await _storage.read(key:'accessToken');

    if(accessToken==null){
      debugPrint('no access token');
      throw Exception('NO TOKEN');
    }

    debugPrint('GET_CATEGORIES(): '+accessToken);

    try{
      final result=await ApiClient.instance.dio.get(
        '/categories',
        options:Options(
          headers:{
            'authorization':'Bearer $accessToken',
          },
        ),
      );

      List<Map<String,dynamic>> todos=List<Map<String,dynamic>>.from(result.data);
      return todos.map((todo)=>ICategory.fromMap(todo)).toList();
    }catch(error){
      debugPrint('could not get the lists :( '+error.toString());
      rethrow;
    }
  }
}
