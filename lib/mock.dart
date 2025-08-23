import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/core/models/itasks_list.dart';
import 'package:ristretto/core/models/itask.dart';
import 'package:ristretto/core/models/ilist_skeleton.dart';
import 'package:ristretto/core/models/gambiarra.dart';

final List<ITasksList> theLists=[
  ITasksList(
    title:'Escola',
    icon:Icons.menu_book,
    tasks:[
      ITask(title:'Atividade de português',deadline:'Hoje'),
      ITask(title:'Atividade de matemática',deadline:'Sexta-feira'),
      ITask(title:'Trabalho de história',deadline:'12/07'),
    ],
    color:AppColors.listColorC,
  ),
  ITasksList(
    title:'Pessoal',
    icon:Icons.home,
    tasks:[
      ITask(title:'Compras da semana',deadline:'Hoje',isComplete:true),
      ITask(title:'Aniversário da Maria',deadline:'Sexta-feira, 20h'),
    ],
    color:AppColors.listColorB,
  ),
  ITasksList(
    title:'Academia',
    icon:Icons.fitness_center,
    tasks:[
      ITask(title:'Peitos e triceps',deadline:'Segunda-feira',isComplete:true),
      ITask(title:'Quadríceps',deadline:'Terça-feira'),
    ],
    color:AppColors.listColorA,
  ),
];

List<Gambiarra> getTodayTasks(){
  List<Gambiarra> todayTasks=[];

  for(int x=0;x<theLists.length;x++){
    ITasksList currentList=theLists[x];

    for(int y=0;y<currentList.tasks.length;y++){
      ITask currentTask=currentList.tasks[y];

      if(currentTask.deadline!='Hoje')continue;

      todayTasks.add(Gambiarra(
        title:currentTask.title,
        color:currentList.color,
        isComplete:currentTask.isComplete,
      ));
    }
  }

  return todayTasks;
}

final List<Gambiarra> todayTasks=getTodayTasks();

final List<IListSkeleton> listsSkeleton=
  theLists
    .map((theList)=>IListSkeleton(
      title:theList.title,
      color:theList.color,
      icon:theList.icon,
    ))
    .toList();
