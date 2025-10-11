import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ristretto/core/models/isigned_in_user.dart';
import 'package:ristretto/core/services/user.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/features/user/presentation/user_section.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

class UserScreen extends StatefulWidget{
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final storage=FlutterSecureStorage();

  IsignedInUser? signedinUser;

  Future<void> x()async{
    final accessToken=await storage.read(key:'accessToken');

    if(accessToken==null)return;

    debugPrint(accessToken);

    final decoded=JwtDecoder.decode(accessToken);

    debugPrint(decoded.toString());
    final userId=decoded['userId'];
    debugPrint(userId.toString());

    final IsignedInUser r=await UserService.instance.getUserById(userId.toString());

    setState(()=>signedinUser=r);

    debugPrint(r.name);
  }

  @override
  void initState(){
    super.initState();
    x();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        SizedBox(
          width:double.infinity,
          height:450,
          child:Image.asset('assets/images/background.png',fit:BoxFit.cover),
        ),
        Positioned(
          right:16,
          top:16,
          child:Icon(Icons.settings),
        ),
        Column(
          children:[
            Container(
              padding:const EdgeInsets.all(24),
              child:Column(
                children:[
                  Text('Bom dia!',style:Theme.of(context).textTheme.bodyMedium),
                  Text(signedinUser==null?'darn':signedinUser!.name,style:Theme.of(context).textTheme.headlineLarge),
                ],
              ),
            ),
            Expanded(
              flex:1,
              child: Container(
                padding:const EdgeInsets.all(16),
                margin:const EdgeInsets.symmetric(horizontal:16),
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(8),
                    topRight:Radius.circular(8),
                  ),
                  border:BoxBorder.all(
                    color:Color(0XFFD9D9D9),
                    width:2,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    spacing:12,
                    children:[
                      Container(
                        padding:const EdgeInsets.all(12),
                        decoration:BoxDecoration(
                          color:Color(0xFFA1C3FF),
                          borderRadius:BorderRadius.circular(8),
                        ),
                        child:Row(
                          spacing:8,
                          children: [
                            Container(
                              padding:EdgeInsets.all(16),
                              decoration:BoxDecoration(
                                color:Color(0XFFC8E1FF),
                                shape:BoxShape.circle,
                              ),
                              child: Icon(Icons.shopping_cart),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Uma caixa de leite',
                                    style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      fontWeight:FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'João, seu progresso está indo bem!',
                                    style:Theme.of(context).textTheme.headlineSmall,
                                    softWrap:true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      UserSection(
                        title:'Estatísticas',
                        child: SingleChildScrollView(
                            scrollDirection:Axis.horizontal,
                            child:Row(
                              spacing:12,
                              children:[
                                Container(
                                  padding:const EdgeInsets.all(12),
                                  decoration:BoxDecoration(
                                    color:Color(0XFFFFE5C8),
                                    borderRadius:BorderRadius.circular(8),
                                  ),
                                  child:Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children:[
                                      Text('Tarefas concluídas',style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        fontWeight:FontWeight.w600,
                                      )),
                                      Text('19',style:Theme.of(context).textTheme.displayLarge),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:const EdgeInsets.all(12),
                                  decoration:BoxDecoration(
                                    color:Color(0xFFEFBEB3),
                                    borderRadius:BorderRadius.circular(8),
                                  ),
                                  child:Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children:[
                                      Text('Rotina',style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        fontWeight:FontWeight.w600,
                                      )),
                                      Text('88%',style:Theme.of(context).textTheme.displayLarge),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                      UserSection(
                        title:'Relatório',
                        child:Container(
                          height:140,
                          decoration:BoxDecoration(
                            color:AppColors.primaryColor,
                            borderRadius:BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      UserSection(
                        title:'Sequência',
                        child:Row(
                          spacing:8,
                          children:[
                            Icon(Icons.flag),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Text('17 Dias',style:Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    fontSize:20,
                                  )),
                                  Text('de atividade',style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight:FontWeight.bold,
                                  )),
                                ],
                              ),
                            ),
                            Icon(Icons.remove_red_eye_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]
    );
  }
}
