import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ristretto/core/models/iuser.dart';
import 'package:ristretto/core/services/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final storage = const FlutterSecureStorage();
  IUser? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      final accessToken = await storage.read(key: 'accessToken');
      if (accessToken == null) {
        debugPrint("Token não encontrado");
        setState(() => _isLoading = false);
        return;
      }

      final decoded = JwtDecoder.decode(accessToken);
      debugPrint("Token decodificado: $decoded");

      final userId = decoded['sub'];
      debugPrint("ID do usuário extraído: $userId");

      if (userId != null) {
        final temp = await UserService.instance.getUserById(int.parse(userId.toString()));
        if (temp != null) {
          setState(() {
            _user = temp;
            _isLoading = false;
          });
        } else {
          debugPrint("Usuário não encontrado no backend");
          setState(() => _isLoading = false);
        }
      } else {
        debugPrint("Campo 'sub' ausente no token");
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint("Erro no _initializeData: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _user == null
              ? const Center(child: Text('Usuário não encontrado'))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá, ${_user!.name}', style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 16),
                      Text('ID: ${_user!.id}'),
                      Text('Email: ${_user!.email}'),
                      if (_user!.theme != null) Text('Tema: ${_user!.theme}'),
                      if (_user!.lastLogin != null)
                        Text('Último login: ${_user!.lastLogin!.toLocal()}'),
                    ],
                  ),
                ),
    );
  }
}