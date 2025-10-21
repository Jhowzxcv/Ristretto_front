import 'package:flutter/material.dart';

import 'package:ristretto/core/themes/colors.dart';

class TasksTitle extends StatelessWidget{
  final int totalTodayTasks;

  const TasksTitle({
    super.key,
    required this.totalTodayTasks,
  });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Text(
          'Minhas Tarefas',
          style:Theme.of(context).textTheme.headlineLarge,
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            // Show how many tasks with today as a deadline
            Text.rich(
              TextSpan(
                text:'$totalTodayTasks tarefas para ',
                style:Theme.of(context).textTheme.headlineSmall,
                children:[
                  const TextSpan(
                    text:'hoje',
                    style:TextStyle(color:AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            Icon(Icons.swap_vert),
          ],
        ),
      ],
    );
  }
}
