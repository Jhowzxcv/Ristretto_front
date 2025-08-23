import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/core/models/itasks_list.dart';
import 'package:ristretto/core/models/itask.dart';
import 'package:ristretto/core/models/ilist_skeleton.dart';
import 'package:ristretto/core/models/gambiarra.dart';

DateTime today=DateTime.now();

final List<ITasksList> theLists=[
  ITasksList(
    title:'Escola',
    color:AppColors.listColorC,
    icon:Icons.menu_book,
    tasks:[
      ITask(
        title:'Atividade de português',
        deadline:today,
      ),
      ITask(
        title:'Atividade de matemática',
        deadline:today.add(Duration(days:1)),
      ),
      ITask(
        title:'Trabalho de história',
        deadline:DateTime(2025,11,4),
      ),
    ],
  ),
  ITasksList(
    title:'Pessoal',
    icon:Icons.home,
    color:AppColors.listColorB,
    tasks:[
      ITask(
        title:'Compras da semana',
        deadline:today,
        isComplete:true,
      ),
      ITask(
        title:'Aniversário da Maria',
        deadline:today.add(Duration(days:3)),
      ),
    ],
  ),
  ITasksList(
    title:'Academia',
    icon:Icons.fitness_center,
    color:AppColors.listColorA,
    tasks:[
      ITask(
        title:'Peitos e triceps',
        deadline:today.add(Duration(days:4)),
        isComplete:true,
      ),
      ITask(
        title:'Quadríceps',
        deadline:DateTime(2026,12,29),
      ),
    ],
  ),
];

List<Gambiarra> getTodayTasks(){
  List<Gambiarra> todayTasks=[];

  for(int x=0;x<theLists.length;x++){
    ITasksList currentList=theLists[x];

    for(int y=0;y<currentList.tasks.length;y++){
      ITask currentTask=currentList.tasks[y];

      if(currentTask.deadline!=today)continue;

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
