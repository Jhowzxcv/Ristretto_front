import 'package:flutter/material.dart';

import 'package:ristretto/models/itask.dart';

class TheTask extends StatelessWidget{
  const TheTask({super.key,required this.task});

  final ITask task;

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Text(
              task.title,
              style:TextStyle(
                fontSize:16,
              ),
            ),
            Text(
              task.deadline,
              style:TextStyle(
                color:Colors.blueGrey[800],
                fontSize:12,
              ),
            ),
          ],
        ),
        Checkbox(
          value:task.isComplete,
          onChanged:null,
          shape:const CircleBorder(),
          side:const BorderSide(
            color:Colors.black,
            width:1.5,
          ),
        ),
      ],
    );
  }
}
