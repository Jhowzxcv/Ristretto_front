import 'package:flutter/material.dart';
import 'package:ristretto/models/itask.dart';
import 'package:ristretto/widgets/the_task.dart';

class TheList extends StatelessWidget {
  const TheList({
    super.key,
    required this.title,
    required this.tasks,
    required this.color,
    required this.icon,
  });

  final String title;
  final List<ITask> tasks;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(6),
        color:color,
      ),
      child: Column(
        spacing:12,
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Row(
                spacing:4,
                children:[
                  Icon(icon),
                  Text(
                    title,
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:18,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Column(
            children:[
              for(int x=0;x<tasks.length;x++)
                TheTask(
                  title:tasks[x].title,
                  deadline:tasks[x].deadline,
                )
            ],
          ),
          Align(
            alignment:Alignment.center,
            child:Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
