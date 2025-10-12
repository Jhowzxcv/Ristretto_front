import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/themes/colors.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class IUserRegisterState{
  String name='';
  String email='';
  String password='';
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final IUserRegisterState _userFormState=IUserRegisterState();
  bool _isPasswordVisible=false;
  bool _errorEmailExists=false;
  bool _isLoading=false;

  // Validate Name Input
  String? _validateName(String? name){
    if(name!.isEmpty)
      return 'Nome não pode ser vazio';
    if(name.length>32)
      return 'Nome é muito longo (máximo: 32 caractéres)';

    return null;
  }

  // Validate Email Input
  String? _validateEmail(String? email){
    if(email!.isEmpty)
      return 'Email não pode ser vazio';
    if(_errorEmailExists)
      return 'Email já está sendo utilizado';

    return null;
  }

  // Validate Password Input
  String? _validatePassword(String? password){
    if(password!.isEmpty)
      return 'Senha não pode ser vazia';

    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^A-Za-z0-9]).{8,}$');

    if(!regex.hasMatch(password))
      return 'A senha deve conter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais';

    return null;
  }

  // Submit Login
  Future<void> _onSubmit(BuildContext context)async{
    _formKey.currentState!.save();

    // Validate Form
    _errorEmailExists=await UserService.instance.verifyEmailExistence(_userFormState.email);
    if(!_formKey.currentState!.validate()||_errorEmailExists)return;

    setState(()=>_isLoading=true);

    final bool isFormValid=await UserService.instance.register(
      name:_userFormState.name,
      email:_userFormState.email,
      password:_userFormState.password,
    );

    if(isFormValid)context.go('/login');

    setState((){
      _isLoading=false;
      _errorEmailExists=false;
    });
  }

  // Toggle Password Visibility
  void _togglePasswordVisibility(){
    setState(()=>_isPasswordVisible=!_isPasswordVisible);
  }

  // Title
  Text _buildFormTitle(BuildContext context){
    return Text(
      'Criar Conta',
      style:Theme.of(context).textTheme.headlineLarge,
    );
  }

  // Name Input
  TextFormField _buildNameInput(){
    return TextFormField(
      decoration:InputDecoration(
        labelText:'Nome',
        errorStyle:TextStyle(
          fontSize:14,
        ),
      ),
      textInputAction:TextInputAction.next,
      initialValue:_userFormState.name,
      keyboardType:TextInputType.text,
      onSaved:(newValue)=>_userFormState.name=newValue!,
      validator:_validateName,
      maxLength:32,
    );
  }

  // Email Input
  TextFormField _buildEmailInput(){
    return TextFormField(
      decoration:InputDecoration(
        labelText:'Email',
        errorStyle:TextStyle(
          fontSize:14,
        ),
      ),
      textInputAction:TextInputAction.next,
      initialValue:_userFormState.email,
      keyboardType:TextInputType.emailAddress,
      onSaved:(newValue)=>_userFormState.email=newValue!,
      validator:_validateEmail,
    );
  }

  // Password Input
  TextFormField _buildPasswordInput(){
    return TextFormField(
      decoration:InputDecoration(
        errorStyle:TextStyle(
          fontSize:14,
        ),
        errorMaxLines:3,
        labelText:'Senha',
        suffixIcon:IconButton(
          icon:Icon(
            _isPasswordVisible
              ?Icons.visibility
              :Icons.visibility_off
            ),
          onPressed:_togglePasswordVisibility,
        ),
      ),
      initialValue:_userFormState.password,
      obscureText:!_isPasswordVisible,
      keyboardType:TextInputType.visiblePassword,
      onSaved:(newValue)=>_userFormState.password=newValue!,
      validator:_validatePassword,
    );
  }

  // Footer Redirection in case User wants to Log In
  Text _buildFormFooter(BuildContext context){
    return Text.rich(
      style:TextStyle(
        fontSize:18,
      ),
      TextSpan(
        text:'Já tem uma conta? ',
        children:[
          TextSpan(
            text:'Fazer Login',
            style:TextStyle(
              color:AppColors.primaryColor,
            ),
            recognizer:TapGestureRecognizer()
              ..onTap=()=>context.go('/login')
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child:Padding(
          padding:const EdgeInsets.all(16),
          child:
            _isLoading
              ?CircularProgressIndicator()
              :Column(
                mainAxisSize:MainAxisSize.min,
                spacing:16,
                children: [
                  _buildFormTitle(context),
                  Form(
                    key:_formKey,
                    child:Column(
                      mainAxisSize:MainAxisSize.min,
                      crossAxisAlignment:CrossAxisAlignment.stretch,
                      spacing:16,
                      children:[
                        _buildNameInput(),
                        _buildEmailInput(),
                        _buildPasswordInput(),
                        // Register Submission
                        FilledButton(
                          onPressed:()=>_onSubmit(context),
                          child:Text('Criar Conta'),
                        ),
                      ],
                    ),
                  ),
                  _buildFormFooter(context),
                ],
              ),
        ),
      ),
    );
  }
}
