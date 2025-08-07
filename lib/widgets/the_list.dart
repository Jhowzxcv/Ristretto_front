import 'package:flutter/material.dart';

import 'package:ristretto/widgets/the_task.dart';

import 'package:ristretto/models/ilist.dart';

class TheList extends StatelessWidget {
  const TheList({
    super.key,
    required this.list,
  });

  final IList list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(6),
        color:list.color,
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
                  Icon(list.icon),
                  Text(
                    list.title,
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
            children:List.generate(
              list.tasks.length,
              (index)=>TheTask(task:list.tasks[index]),
            ),
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
