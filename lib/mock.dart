import 'package:flutter/material.dart';

import 'package:ristretto/models/ilist.dart';
import 'package:ristretto/models/itask.dart';
import 'package:ristretto/models/list_simple.dart';

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

final List<IList> lists=[list1,list2,list3];

final List<ListSimple> listsSimple=[
  ListSimple(title:'Escola',icon:Icons.menu_book,color:Colors.blue[100]!),
  ListSimple(title:'Pessoal',icon:Icons.home,color:Colors.orange[100]!),
  ListSimple(title:'Academia',icon:Icons.fitness_center,color:Colors.red[100]!),
];
