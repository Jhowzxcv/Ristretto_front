import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/features/user/presentation/user_section.dart';

class UserScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        SizedBox(
          width:double.infinity,
          height:325,
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
                  Text('João Pedro',style:Theme.of(context).textTheme.headlineLarge),
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
                  )
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
                            Icon(Icons.shopping_cart),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Uma caixa de leite',
                                    style:Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'João, seu progresso está indo bem!',
                                    style:Theme.of(context).textTheme.bodyMedium,
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
                                      Text('Tarefas concluídas',style:Theme.of(context).textTheme.titleMedium),
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
                                      Text('Rotina',style:Theme.of(context).textTheme.titleMedium),
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
