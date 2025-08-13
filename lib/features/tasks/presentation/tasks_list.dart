import 'package:flutter/material.dart';

import 'package:ristretto/features/tasks/presentation/tasks_list_item.dart';

import 'package:ristretto/core/models/itasks_list.dart';

class TasksList extends StatefulWidget {
  final ITasksList list;

  const TasksList(this.list,{super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(16),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(6),
        color:widget.list.color,
      ),
      child: Column(
        spacing:8,
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
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Column(
            spacing:6,
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
    );
  }
}
