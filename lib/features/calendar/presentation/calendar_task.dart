import 'package:flutter/material.dart';

import 'package:ristretto/core/commons/widgets/the_checkbox.dart';

import 'package:ristretto/core/models/gambiarra.dart';

class TodayTask extends StatelessWidget{
  final Gambiarra task;
  final void Function() toggleTaskState;

  const TodayTask(
    this.task,
    {
      super.key,
      required this.toggleTaskState,
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(16),
      decoration:BoxDecoration(
        color:task.color,
        borderRadius:BorderRadius.circular(8),
      ),
      child:IntrinsicHeight(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            // Show Task Title
            Text(
              task.title,
              style:Theme.of(context).textTheme.headlineSmall,
            ),
            // Toggle Task Completeness
            TheCheckbox(
              isChecked:task.isComplete,
              toggleState:toggleTaskState,
            ),
          ],
        ),
      ),
    );
  }
}
