import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/models/iuser.dart';
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

  bool errorEmailExists=false;

  Future<void> onSubmit(BuildContext context)async{
    _formKey.currentState!.save();

    // validating
    errorEmailExists=await UserService.instance.verifyEmailExistence(userFormState.email);
    if(!_formKey.currentState!.validate())return;

    // create user
    final newUser=IUser(
      name:userFormState.name,
      email:userFormState.email,
      password:userFormState.password,
    );

    await UserService.instance.createUser(newUser);

    context.go('/login');
  }

  String? validateName(String? value){
    if(value!.isEmpty)return 'Nome não pode ser vazio';
    if(value.length>32)return 'Nome é muito longo (máximo: 32 caractéres)';

    return null;
  }

  String? validateEmail(String? value){
    if(value!.isEmpty)return 'Email não pode ser vazio';
    if(errorEmailExists)return 'Email já está sendo utilizado';

    return null;
  }

  String? validatePassword(String? value){
    if(value!.isEmpty)return 'Senha não pode ser vazia';

    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^A-Za-z0-9]).{8,}$');

    if(!regex.hasMatch(value!))
      return 'A senha deve conter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais';

    return null;
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
                        errorStyle:TextStyle(
                          fontSize:14,
                        ),
                      ),
                      keyboardType:TextInputType.text,
                      onSaved: (newValue) => userFormState.name=newValue!,
                      validator:validateName,
                      maxLength:32,
                    ),
                    TextFormField(
                      decoration:InputDecoration(
                        labelText:'Email',
                        errorStyle:TextStyle(
                          fontSize:14,
                        ),
                      ),
                      keyboardType:TextInputType.emailAddress,
                      onSaved: (newValue) => userFormState.email=newValue!,
                      validator:validateEmail,
                    ),
                    TextFormField(
                      obscureText:!isPasswordVisible,
                      decoration:InputDecoration(
                        errorStyle:TextStyle(
                          fontSize:14,
                        ),
                        errorMaxLines:3,
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
                      validator:validatePassword,
                    ),
                    FilledButton(
                      onPressed:(){
                        onSubmit(context);
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
