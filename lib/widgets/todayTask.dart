import 'package:flutter/material.dart';

import 'package:ristretto/models/itask.dart';

class TodayTask extends StatelessWidget{
  const TodayTask(this.task,{super.key});

  final ITask task;

  @override
  Widget build(BuildContext){
    return Container(
      padding:const EdgeInsets.all(4),
      decoration:BoxDecoration(
        color:Colors.red,
        borderRadius:BorderRadius.circular(8),
      ),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:[
          Text(task.title),
          Checkbox(
            value:task.isComplete,
            onChanged:null,
          ),
        ],
      ),
    );
  }
}
