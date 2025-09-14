import 'package:flutter/material.dart';
import 'dart:math';

import 'package:ristretto/features/tasks/presentation/tasks_list_item.dart';

import 'package:ristretto/core/models/itasks_list.dart';

class TasksList extends StatefulWidget{
  final ITasksList list;

  const TasksList(this.list,{super.key});

  @override
  State<TasksList> createState()=>_TasksListState();
}

class _TasksListState extends State<TasksList>{
  bool visibility=true;

  @override
  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(16),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(8),
        color:widget.list.color,
      ),
      child: Column(
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              // Show List Title
              Row(
                spacing:4,
                children:[
                  Icon(widget.list.icon),
                  Text(
                    widget.list.title,
                    style:Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              // Button to Toggle Visibility of Tasks (show or hide them)
              GestureDetector(
                onTap:()=>
                  setState(()=>visibility=!visibility),
                child:Transform.rotate(
                  angle:visibility?0:pi,
                  child:Icon(Icons.keyboard_arrow_down_sharp),
                ),
              ),
            ],
          ),
          // Show Tasks Container
          AnimatedSize(
            duration:Duration(milliseconds:250),
            child:SizedBox(
              height:visibility?null:0,
              child: Column(
                children:[
                  SizedBox(height:16),
                  // Show Tasks
                  Column(
                    spacing:12,
                    children:widget.list.tasks
                      .map((task)=>TasksListItem(
                        task,
                        toggleTaskState:()=>setState((){
                          debugPrint(task.title);
                          task.toggleState();
                        })
                      ))
                      .toList(),
                  ),
                  // Button to Add new task to Current List
                  Align(
                    alignment:Alignment.center,
                    child:GestureDetector(
                      onTap:(){},
                      child:Icon(Icons.add),
                    ),
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
