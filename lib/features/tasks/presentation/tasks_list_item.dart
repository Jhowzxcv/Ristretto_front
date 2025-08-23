import 'package:flutter/material.dart';

import 'package:ristretto/core/commons/widgets/the_checkbox.dart';

import 'package:ristretto/core/commons/utils/date.dart';
import 'package:ristretto/core/models/itask.dart';
import 'package:ristretto/core/themes/colors.dart';

class TasksListItem extends StatelessWidget{
  final ITask task;
  final void Function() toggleTaskState;

  const TasksListItem(this.task,{super.key,required this.toggleTaskState});

  @override
  Widget build(BuildContext context){
    // return IntrinsicHeight(
    //   child: ListTile(
    //     contentPadding:EdgeInsets.zero,
    //     title:Text(
    //       task.title,
    //       style:Theme.of(context).textTheme.headlineSmall
    //     ),
    //     subtitle:Text(
    //       task.deadline,
    //       style:TextStyle(
    //         fontWeight:FontWeight.w400,
    //         fontSize:14,
    //         color:AppColors.secondaryColor,
    //       ),
    //     ),
    //     trailing:TheCheckbox(
    //       isChecked:task.isComplete,
    //       toggleState:toggleTaskState,
    //     ),
    //   ),
    // );
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:[
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text(
                task.title,
                style:Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                formatDeadline(task.deadline),
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontSize:14,
                  color:AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          TheCheckbox(
            isChecked:task.isComplete,
            toggleState:toggleTaskState,
          ),
        ],
      ),
    );
  }
}
