import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/themes/colors.dart';

// ... imports mantidos

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class IUserRegisterState {
  String name = '';
  String email = '';
  String password = '';
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final IUserRegisterState _userFormState = IUserRegisterState();
  bool _isPasswordVisible = false;
  bool _errorEmailExists = false;
  bool _isLoading = false;
  String? _errorMessage;

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Nome não pode ser vazio';
    }
    if (name.length > 32) {
      return 'Nome é muito longo (máximo: 32 caracteres)';
    }
    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email não pode ser vazio';
    }
    if (_errorEmailExists) {
      return 'Email já está sendo utilizado';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Senha não pode ser vazia';
    }
    final regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^A-Za-z0-9]).{8,}$');
    if (!regex.hasMatch(password)) {
      return 'A senha deve conter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais';
    }
    return null;
  }

  Future<void> _onSubmit(BuildContext context) async {
    _formKey.currentState!.save();

    _errorEmailExists =
        await UserService.instance.verifyEmailExistence(_userFormState.email);

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final bool success = await UserService.instance.register(
      name: _userFormState.name,
      email: _userFormState.email,
      password: _userFormState.password,
    );

    setState(() {
      _isLoading = false;
      _errorEmailExists = false;
    });

    if (success) {
      context.go('/login');
    } else {
      setState(() {
        _errorMessage = "Erro ao registrar. Tente novamente.";
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  Text _buildFormTitle(BuildContext context) {
    return Text(
      'Criar Conta',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  TextFormField _buildNameInput() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        errorStyle: TextStyle(fontSize: 14),
      ),
      textInputAction: TextInputAction.next,
      initialValue: _userFormState.name,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => _userFormState.name = newValue ?? '',
      validator: _validateName,
      maxLength: 32,
    );
  }

  TextFormField _buildEmailInput() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        errorStyle: TextStyle(fontSize: 14),
      ),
      textInputAction: TextInputAction.next,
      initialValue: _userFormState.email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _userFormState.email = newValue ?? '',
      validator: _validateEmail,
    );
  }

  TextFormField _buildPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 14),
        errorMaxLines: 3,
        labelText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      initialValue: _userFormState.password,
      obscureText: !_isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => _userFormState.password = newValue ?? '',
      validator: _validatePassword,
    );
  }

  Text _buildFormFooter(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Já tem uma conta? ',
        children: [
          TextSpan(
            text: 'Fazer Login',
            style: const TextStyle(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = () => context.go('/login'),
          ),
        ],
      ),
      style: const TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildFormTitle(context),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildNameInput(),
                          const SizedBox(height: 16),
                          _buildEmailInput(),
                          const SizedBox(height: 16),
                          _buildPasswordInput(),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () => _onSubmit(context),
                            child: const Text('Criar Conta'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    _buildFormFooter(context),
                  ],
                ),
        ),
      ),
    );
  }
}