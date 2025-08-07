import 'package:flutter/material.dart';

import 'package:ristretto/widgets/the_list.dart';

import 'package:ristretto/mock.dart';

class TasksScreen extends StatelessWidget{
  final Widget title=
    Padding(
      padding:const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Text(
            'Minhas Tarefas',
            style:TextStyle(
              fontWeight:FontWeight.bold,
              fontSize:26,
            ),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Text.rich(
                style:TextStyle(
                  fontSize:16,
                ),
                TextSpan(
                  text:'2 tarefas para ',
                  children:[
                    TextSpan(
                      text:'hoje',
                      style:TextStyle(color:Colors.blue[500]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.swap_vert),
            ],
          ),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        title,
        Expanded(
          child:SingleChildScrollView(
            child:Container(
              padding:const EdgeInsets.symmetric(horizontal:16),
              child:Column(
                spacing:16,
                children:[
                  TheList(list:lists[0]),
                  TheList(list:lists[1]),
                  TheList(list:lists[2]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
