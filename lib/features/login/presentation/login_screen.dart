import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/themes/colors.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class IUserFormState{
  String email='';
  String password='';
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible=false;
  IUserFormState userFormState=IUserFormState();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

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
              Text(
                'Fazer Login',
                style:Theme.of(context).textTheme.headlineLarge,
              ),
              Form(
                key:_formKey,
                child:Column(
                  mainAxisSize:MainAxisSize.min,
                  crossAxisAlignment:CrossAxisAlignment.stretch,
                  spacing:16,
                  children:[
                    TextFormField(
                      decoration:InputDecoration(
                        labelText:'Email',
                      ),
                      keyboardType:TextInputType.emailAddress,
                      onSaved: (newValue) => userFormState.email=newValue!,
                    ),
                    TextFormField(
                      obscureText:!isPasswordVisible,
                      decoration:InputDecoration(
                        labelText:'Senha',
                        suffixIcon:IconButton(
                          icon:Icon(
                            isPasswordVisible
                              ?Icons.visibility
                              :Icons.visibility_off
                            ),
                          onPressed:(){
                            setState(()=>isPasswordVisible=!isPasswordVisible);
                          },
                        ),
                      ),
                      keyboardType:TextInputType.visiblePassword,
                      onSaved: (newValue) => userFormState.password=newValue!,
                    ),
                    FilledButton(
                      onPressed:(){
                        _formKey.currentState!.save();

                        // debugPrint(userFormState.email);
                        // debugPrint(userFormState.password);
                      },
                      child:Text('Criar Conta'),
                    ),
                  ],
                ),
              ),
              Text.rich(
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
                        ..onTap=(){
                          context.go('/register');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
