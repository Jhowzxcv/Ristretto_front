import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ristretto/core/models/iuser.dart';
import 'package:ristretto/core/services/api_client.dart';

class UserService {
  static final UserService instance = UserService._constructor();
  UserService._constructor();

  final _storage = const FlutterSecureStorage();

  /// LOGIN
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiClient.instance.dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      final accessToken = response.data['token'];
      if (accessToken != null) {
        await _storage.write(key: 'accessToken', value: accessToken);
        ApiClient.instance.dio.options.headers['Authorization'] = 'Bearer $accessToken';
        return true;
      }
      return false;
    } catch (error) {
      print("Erro no login: $error");
      return false;
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    await _storage.delete(key: 'accessToken');
    ApiClient.instance.dio.options.headers.remove('Authorization');
  }

  /// REGISTRO
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    String? theme,
    int? defaultReminderMin,
    String? avatarUrl,
  }) async {
    try {
      final response = await ApiClient.instance.dio.post(
        '/user',
        data: {
          'name': name,
          'email': email,
          'password': password,
          if (theme != null) 'theme': theme,
          if (defaultReminderMin != null) 'defaultReminderMin': defaultReminderMin,
          if (avatarUrl != null) 'avatarUrl': avatarUrl,
        },
      );
      return response.statusCode == 201;
    } catch (error) {
      print("Erro no registro: $error");
      return false;
    }
  }

  /// BUSCAR USUÁRIO POR ID
  Future<IUser?> getUserById(int userId) async {
    try {
      final response = await ApiClient.instance.dio.get('/user/$userId');
      return IUser.fromJson(response.data);
    } catch (error) {
      print("Erro ao buscar usuário: $error");
      return null;
    }
  }

  /// VERIFICAR SE E-MAIL EXISTE
  Future<bool> verifyEmailExistence(String email) async {
    try {
      final response = await ApiClient.instance.dio.get(
        '/user/check-email',
        queryParameters: {'email': email},
      );
      return response.data['exists'] == true;
    } catch (error) {
      print("Erro ao verificar email: $error");
      return false;
    }
  }

  /// ATUALIZAR PERFIL DO USUÁRIO
  Future<bool> updateUser(int userId, Map<String, dynamic> updates) async {
    try {
      final response = await ApiClient.instance.dio.put(
        '/user/$userId',
        data: updates,
      );
      return response.statusCode == 200;
    } catch (error) {
      print("Erro ao atualizar usuário: $error");
      return false;
    }
  }

  /// RECUPERAR TOKEN
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  /// VERIFICAR SE ESTÁ AUTENTICADO
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null;
  }
}