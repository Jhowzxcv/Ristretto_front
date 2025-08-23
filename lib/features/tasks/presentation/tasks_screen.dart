import 'package:flutter/material.dart';

import 'package:ristretto/features/tasks/presentation/tasks_title.dart';
import 'package:ristretto/features/tasks/presentation/tasks_list.dart';

import 'package:ristretto/mock.dart';

class TasksScreen extends StatelessWidget{
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(16),
      child: Column(
        spacing:16,
        children:[
          TasksTitle(totalTodayTasks:todayTasks.length),
          Expanded(
            child:SingleChildScrollView(
              child:Column(
                spacing:16,
                children:[
                  TasksList(theLists[0]),
                  TasksList(theLists[1]),
                  TasksList(theLists[2]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
