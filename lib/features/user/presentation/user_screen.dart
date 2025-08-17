import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

class UserScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blue,
      child: Column(
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
              color:Colors.white,
              padding:const EdgeInsets.all(16),
              margin:const EdgeInsets.symmetric(horizontal:16),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                spacing:4,
                children:[
                  Container(
                    padding:const EdgeInsets.all(4),
                    decoration:BoxDecoration(
                      color:Color(0xFFA1C3FF),
                      borderRadius:BorderRadius.circular(8),
                    ),
                    child:Row(
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
                  Text(
                    'Estatísticas',
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                  SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    child:Row(
                      spacing:4,
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
                  Text(
                    'Relatório',
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                  Expanded(
                    child:Container(
                      decoration:BoxDecoration(
                        color:AppColors.primaryColor,
                        borderRadius:BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Text(
                    'Sequência',
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
