import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/themes/colors.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class IUserFormState{
  String name='';
  String email='';
  String password='';
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                'Criar Conta',
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
                        labelText:'Nome',
                      ),
                      keyboardType:TextInputType.text,
                      onSaved: (newValue) => userFormState.name=newValue!,
                    ),
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
              
                        // debugPrint(userFormState.name);
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
                  text:'Já tem uma conta? ',
                  children:[
                    TextSpan(
                      text:'Fazer Login',
                      style:TextStyle(
                        color:AppColors.primaryColor,
                      ),
                      recognizer:TapGestureRecognizer()
                        ..onTap=(){
                          context.go('/login');
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
