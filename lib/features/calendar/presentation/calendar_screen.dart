import 'package:flutter/material.dart';

import 'package:ristretto/core/commons/utils/date.dart';
import 'package:ristretto/core/themes/colors.dart';
import 'package:ristretto/features/calendar/presentation/calendar_task.dart';

import 'package:ristretto/mock.dart';

class CalendarScreen extends StatefulWidget{
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState()=>_CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>{
  // Set current day to today by default
  DateTime currentDay=DateTime.now();

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
                // Show current month
                Text(
                  getCurrentMonth(currentDay),
                  style:Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:[
                    // Button to navigate back one day
                    GestureDetector(
                      onTap:(){
                        // setState(()=>currentDay=currentDay.add(Duration(days:-1)));
                      },
                      child: Icon(
                        Icons.arrow_left,
                        color:AppColors.primaryColor,
                      ),
                    ),
                    // Show current day
                    Text(
                      formatDay(today,currentDay),
                      style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:AppColors.primaryColor,
                      ),
                    ),
                    // Button to navigate forward one day
                    GestureDetector(
                      onTap:(){
                        // setState(()=>currentDay=currentDay.add(Duration(days:1)));
                      },
                      child:Icon(
                        Icons.arrow_right,
                        color:AppColors.primaryColor,
                      ),
                    )
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
                    // Show current day in number
                    Text(
                      '${currentDay.day}',
                      style:TextStyle(
                        height:1,
                        fontWeight:FontWeight.w400,
                        fontSize:48,
                      ),
                    ),
                    // Show tasks for current day
                    Expanded(
                      child:Column(
                        spacing:10,
                        children:todayTasks
                          .map((todayTask)=>
                            TodayTask(
                              todayTask,
                              toggleTaskState:()=>
                                setState(()=>todayTask.toggleState()),
                            )
                          )
                          .toList(),
                      ),
                    ),
                    // Button to Add new task for current day
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
