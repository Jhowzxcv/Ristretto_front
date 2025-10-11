import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  final _storage=FlutterSecureStorage();

  bool loginError=false;

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  Future<void> onSubmit(BuildContext context)async{
    _formKey.currentState!.save();

    // validating
    // if(!_formKey.currentState!.validate())return;

    // final bool result=await UserService.instance.verifyLogin(
    //   email:userFormState.email,
    //   password:userFormState.password,
    // );

    // if(!result){
    //   setState(()=>loginError=true);
    //   return;
    // }

    await _storage.delete(key: 'accessToken');

    try{
      await UserService.instance.login(
        email:userFormState.email,
        password:userFormState.password,
      );

      debugPrint('Login successfully');
      setState(()=>loginError=false);

      final token=await _storage.read(key:'accessToken');
      debugPrint(token);
      context.go('/user');
    }catch(err){
      debugPrint('Login failed: ');
      debugPrint(err.toString());
      setState(()=>loginError=true);
    }
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
                        errorStyle:TextStyle(
                          fontSize:14,
                        ),
                      ),
                      keyboardType:TextInputType.emailAddress,
                      onSaved: (newValue) => userFormState.email=newValue!,
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
                    ),
                    if(loginError)
                      Text(
                        'Email e senha incorretos',
                        textAlign:TextAlign.center,
                        style:TextStyle(
                          fontSize:16,
                          fontWeight:FontWeight.w500,
                          color:Colors.red,
                        ),
                      ),
                    FilledButton(
                      onPressed:(){
                        onSubmit(context);
                      },
                      child:Text('Fazer Login'),
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
