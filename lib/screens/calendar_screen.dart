import 'package:flutter/material.dart';

import 'package:ristretto/widgets/todayTask.dart';

import 'package:ristretto/models/itask.dart';

import 'package:ristretto/mock.dart';

class CalendarScreen extends StatelessWidget{
  final List<ITask> todayTasks=[
    list1.tasks[0],
    list2.tasks[0],
  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(
            padding:const EdgeInsets.fromLTRB(16,16,16,0),
            child: Column(
              children:[
                Text(
                  'Julho',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:26,
                  ),
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  spacing:4,
                  children:[
                    Icon(Icons.arrow_left,color:Colors.blue[500]),
                    Text(
                      'Hoje',
                      style:TextStyle(
                        color:Colors.blue[500],
                      ),
                    ),
                    Icon(Icons.arrow_right,color:Colors.blue[500]),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child:Container(
              margin:const EdgeInsets.all(16),
              padding:const EdgeInsets.all(8),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(6),
                border:BoxBorder.all(color:Colors.grey[400]!,width:2),
              ),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text('9',style:TextStyle(
                    fontSize:36,
                  )),
                  Expanded(
                    child:
                      ListView.separated(
                        separatorBuilder:(context, index)=>SizedBox(height:8),
                        itemCount:todayTasks.length,
                        itemBuilder:(context,index)=>
                          TodayTask(todayTasks[index]),
                      ),
                  ),
                ],
              ),
            )
          ),
        ],
      );
  }
}
