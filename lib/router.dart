import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/screens/tasks_screen.dart';
import 'package:ristretto/screens/calendar_screen.dart';
import 'package:ristretto/screens/add_task_screen.dart';
import 'package:ristretto/screens/timer_screen.dart';
import 'package:ristretto/screens/user_screen.dart';

List<String>_routesMap=[
  '/tasks',
  '/calendar',
  '/add-task',
  '/timer',
  '/user',
];

int _getIndexBasedOnLocation(String location){
  int index=_routesMap.indexOf(location);
  return index>=0?index:0;
}

final List<BottomNavigationBarItem> _navItems=[
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
];

final List<GoRoute> _routes=[
  GoRoute(
    path:'/tasks',
    builder:(context,state)=>TasksScreen(),
  ),
  GoRoute(
    path:'/calendar',
    builder:(context,state)=>CalendarScreen(),
  ),
  GoRoute(
    path:'/add-task',
    builder:(context,state)=>AddTaskScreen(),
  ),
  GoRoute(
    path:'/timer',
    builder:(context,state)=>TimerScreen(),
  ),
  GoRoute(
    path:'/user',
    builder:(context,state)=>UserScreen(),
  ),
];

final GoRouter router=GoRouter(
  initialLocation:'/tasks',
  routes:[
    ShellRoute(
      builder:(context,state,child){
        return Scaffold(
          body:SafeArea(child:child),
          bottomNavigationBar:BottomNavigationBar(
            selectedItemColor:Colors.blue[500],
            type:BottomNavigationBarType.fixed,
            items:_navItems,
            currentIndex:_getIndexBasedOnLocation(state.matchedLocation),
            onTap:(index)=>context.go(_routesMap[index]),
          ),
        );
      },
      routes:_routes,
    ),
  ],
);
