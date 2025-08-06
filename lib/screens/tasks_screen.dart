import 'package:flutter/material.dart';
import 'package:ristretto/models/ilist.dart';
import 'package:ristretto/screens/the_list.dart';

import 'package:ristretto/models/itask.dart';

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
              fontSize:20,
            ),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Text.rich(
                style:TextStyle(
                  fontSize:14,
                ),
                TextSpan(
                  text:'2 tarefas para ',
                  children:[
                    TextSpan(
                      text:'hoje',
                      style:TextStyle(color:Colors.blueAccent),
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

  final IList list1=IList(
    title:'Escola',
    icon:Icons.menu_book,
    tasks:[
      ITask(title:'Atividade de português',deadline:'Hoje'),
      ITask(title:'Atividade de matemática',deadline:'Sexta-feira'),
      ITask(title:'Trabalho de história',deadline:'12/07'),
    ],
    color:Colors.blue[100]!,
  );

  final IList list2=IList(
    title:'Pessoal',
    icon:Icons.home,
    tasks:[
      ITask(title:'Compras da semana',deadline:'Hoje'),
      ITask(title:'Aniversário da Maria',deadline:'Sexta-feira, 20h'),
    ],
    color:Colors.orange[100]!,
  );

  final IList list3=IList(
    title:'Academia',
    icon:Icons.fitness_center,
    tasks:[
      ITask(title:'Peitos e triceps',deadline:'Segunda-feira'),
      ITask(title:'Quadríceps',deadline:'Terça-feira'),
    ],
    color:Colors.red[100]!,
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
                  TheList(
                    title:list1.title,
                    tasks:list1.tasks,
                    color:list1.color,
                    icon:list1.icon,
                  ),
                  TheList(
                    title:list2.title,
                    tasks:list2.tasks,
                    color:list2.color,
                    icon:list2.icon,
                  ),
                  TheList(
                    title:list3.title,
                    tasks:list3.tasks,
                    color:list3.color,
                    icon:list3.icon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
