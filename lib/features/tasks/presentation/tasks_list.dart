import 'package:flutter/material.dart';

import 'package:ristretto/features/tasks/presentation/tasks_list_item.dart';

import 'package:ristretto/core/models/itasks_list.dart';

import 'dart:math';

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
              GestureDetector(
                onTap:(){
                  debugPrint('toggling visibility');
                  setState((){
                    visibility=!visibility;
                  });
                },
                child:Transform.rotate(
                  angle:visibility?0:pi,
                  child:Icon(Icons.keyboard_arrow_down_sharp),
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration:Duration(milliseconds:267),
            child:SizedBox(
              height:visibility?null:0,
              child: Column(
                children:[
                  SizedBox(height:16),
                  Column(
                    spacing:12,
                    children:List.generate(
                      widget.list.tasks.length,
                      (index)=>TasksListItem(
                        widget.list.tasks[index],
                        toggleTaskState:(){
                          setState((){
                            widget.list.tasks[index].toggleState();
                          });
                        },
                      ),
                    ),
                  ),
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
