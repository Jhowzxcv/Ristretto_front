import 'package:flutter/material.dart';

import 'package:ristretto/core/commons/widgets/the_checkbox.dart';

import 'package:ristretto/core/models/itask.dart';

class TasksListItem extends StatelessWidget{
  final ITask task;
  final void Function() toggleTaskState;

  const TasksListItem(this.task,{super.key,required this.toggleTaskState});

  @override
  Widget build(BuildContext context){
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:[
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text(
                task.title,
                style:Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                task.deadline,
                style:Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          TheCheckbox(
            initialValue:task.isComplete,
            toggleState:toggleTaskState,
          ),
        ],
      ),
    );
  }
}
