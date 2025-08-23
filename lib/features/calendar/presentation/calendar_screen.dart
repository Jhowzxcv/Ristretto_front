import 'package:flutter/material.dart';

import 'package:ristretto/core/commons/utils/date.dart';
import 'package:ristretto/core/themes/colors.dart';
import 'package:ristretto/features/calendar/presentation/calendar_task.dart';

import 'package:ristretto/mock.dart';

DateTime today=DateTime.now();

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
          spacing:16,
          children:[
            Column(
              spacing:10,
              children:[
                Text(
                  months[today.month-1],
                  style:Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
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
                  borderRadius:BorderRadius.circular(8),
                  border:BoxBorder.all(
                    color:Color(0xFFD9D9D9),
                    width:2,
                  ),
                ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  spacing:24,
                  children:[
                    Text(
                      '${today.day}',
                      style:TextStyle(
                        height:1,
                        fontWeight:FontWeight.w400,
                        fontSize:48,
                      ),
                    ),
                    Expanded(
                      child:
                        ListView.separated(
                          separatorBuilder:(context,index)=>SizedBox(height:10),
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
