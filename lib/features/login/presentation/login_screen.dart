import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/themes/colors.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState()=>_LoginScreenState();
}

class ILoginFormState{
  String email='';
  String password='';
}

class _LoginScreenState extends State<LoginScreen>{
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final ILoginFormState _userFormState=ILoginFormState();
  bool _isPasswordVisible=false;
  bool _loginError=false;

  // Form Submission
  Future<void> _onSubmit(BuildContext context)async{
    _formKey.currentState!.save();

    try{
      await UserService.instance.login(
        email:_userFormState.email,
        password:_userFormState.password,
      );

      // Login Success
      setState(()=>_loginError=false);
      context.go('/user');
    }catch(err){
      // Login Failed
      setState(()=>_loginError=true);
    }
  }

  // Toggle Password Visibility
  void _togglePasswordVisibility(){
    setState(()=>_isPasswordVisible=!_isPasswordVisible);
  }

  // Title
  Text _buildFormTitle(BuildContext context){
    return Text(
      'Fazer Login',
      style:Theme.of(context).textTheme.headlineLarge,
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
      keyboardType:TextInputType.emailAddress,
      onSaved:(newValue)=>_userFormState.email=newValue!,
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
      obscureText:!_isPasswordVisible,
      keyboardType:TextInputType.visiblePassword,
      onSaved:(newValue)=>_userFormState.password=newValue!,
    );
  }

  // Login Error Message
  Text _buildLoginError(){
    return Text(
      'Email e senha incorretos',
      textAlign:TextAlign.center,
      style:TextStyle(
        fontSize:16,
        fontWeight:FontWeight.w500,
        color:Colors.red,
      ),
    );
  }

  // Footer Redirection in case User doesn't have an Account
  Text _buildFormFooter(BuildContext context) {
    return Text.rich(
      style:TextStyle(
        fontSize:18,
      ),
      TextSpan(
        text:'Não tem conta ainda? ',
        children:[
          TextSpan(
            text:'Criar conta',
            style:TextStyle(
              color:AppColors.primaryColor,
            ),
            recognizer:TapGestureRecognizer()
              ..onTap=()=>context.go('/register'),
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
          child: Column(
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
                    _buildEmailInput(),
                    _buildPasswordInput(),
                    if(_loginError)_buildLoginError(),
                    // Login Submission
                    FilledButton(
                      onPressed:()=>_onSubmit(context),
                      child:Text('Fazer Login'),
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
