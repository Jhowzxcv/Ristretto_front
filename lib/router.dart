import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/screens/tasks_screen.dart';
import 'package:ristretto/screens/calendar_screen.dart';
import 'package:ristretto/screens/add_task_screen.dart';
import 'package:ristretto/screens/timer_screen.dart';
import 'package:ristretto/screens/user_screen.dart';

int _getIndexBasedOnLocation(String location){
  switch(location){
    case '/tasks':return 0;
    case '/calendar':return 1;
    case '/add-task':return 2;
    case '/timer':return 3;
    case '/user':return 4;
  }

  return -1;
}

final GoRouter router=GoRouter(
  initialLocation:'/tasks',
  routes:[
    ShellRoute(
      builder:(context,state,child){
        return Scaffold(
          body:SafeArea(child:child),
          bottomNavigationBar:BottomNavigationBar(
            selectedItemColor:Colors.blueAccent,
            items:[
              BottomNavigationBarItem(
                label:'',
                icon:Icon(Icons.list),
              ),
              BottomNavigationBarItem(
                label:'',
                icon:Icon(Icons.calendar_month),
              ),
              BottomNavigationBarItem(
                label:'',
                icon:Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label:'',
                icon:Icon(Icons.timer),
              ),
              BottomNavigationBarItem(
                label:'',
                icon:Icon(Icons.person),
              ),
            ],
            type:BottomNavigationBarType.fixed,
            currentIndex:_getIndexBasedOnLocation(state.matchedLocation),
            onTap:(index){
              switch(index){
                case 0:context.go('/tasks');break;
                case 1:context.go('/calendar');break;
                case 2:context.go('/add-task');break;
                case 3:context.go('/timer');break;
                case 4:context.go('/user');break;
              }
            },
          ),
        );
      },
      routes:[
        GoRoute(
          name:'tasks',
          path:'/tasks',
          builder:(context,state)=>TasksScreen(),
        ),
        GoRoute(
          name:'calendar',
          path:'/calendar',
          builder:(context,state)=>CalendarScreen(),
        ),
        GoRoute(
          name:'add-task',
          path:'/add-task',
          builder:(context,state)=>AddTaskScreen(),
        ),
        GoRoute(
          name:'timer',
          path:'/timer',
          builder:(context,state)=>TimerScreen(),
        ),
        GoRoute(
          name:'user',
          path:'/user',
          builder:(context,state)=>UserScreen(),
        ),
      ],
    ),
  ],
);
