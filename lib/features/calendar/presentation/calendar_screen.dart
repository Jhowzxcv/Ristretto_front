import 'package:flutter/material.dart';

import 'package:ristretto/core/themes/colors.dart';
import 'package:ristretto/features/calendar/presentation/calendar_task.dart';

import 'package:ristretto/mock.dart';

class CalendarScreen extends StatefulWidget{
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState()=>_CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>{
  @override
  Widget build(BuildContext context){
    return
      Padding(
        padding:const EdgeInsets.all(16),
        child: Column(
          // spacing:16,
          children:[
            Column(
              children:[
                Text(
                  'Julho',
                  style:Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  // spacing:4,
                  children:[
                    Icon(
                      Icons.arrow_left,
                      color:AppColors.primaryColor,
                    ),
                    Text(
                      'Hoje',
                      style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:AppColors.primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color:AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child:Container(
                padding:const EdgeInsets.all(16),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(6),
                  border:BoxBorder.all(
                    color:Color(0xFFD9D9D9),
                    width:2,
                  ),
                ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  // spacing:8,
                  children:[
                    Text(
                      '9',
                      style:TextStyle(
                        height:1,
                        fontWeight:FontWeight.w400,
                        fontSize:48,
                      ),
                    ),
                    Expanded(
                      child:
                        ListView.separated(
                          separatorBuilder:(context,index)=>SizedBox(height:0),
                          itemCount:todayTasks.length,
                          itemBuilder:(context,index)=>
                            TodayTask(
                              todayTasks[index],
                              toggleTaskState:(){
                                setState((){
                                  todayTasks[index].toggleState();
                                });
                              },
                            ),
                        ),
                    ),
                    Align(
                      alignment:Alignment.center,
                      child:Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      );
  }
}
