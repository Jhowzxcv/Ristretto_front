import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/features/tasks/presentation/tasks_screen.dart';
import 'package:ristretto/features/calendar/presentation/calendar_screen.dart';

import 'package:ristretto/features/add_task/presentation/add_task_screen.dart';
import 'package:ristretto/features/add_list/presentation/add_list_screen.dart';

import 'package:ristretto/features/timer/presentation/timer_screen.dart';
import 'package:ristretto/features/user/presentation/user_screen.dart';

import 'package:ristretto/features/login/presentation/login_screen.dart';
import 'package:ristretto/features/register/presentation/register_screen.dart';

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
    routes:[
      GoRoute(
        path:'add-list',
        builder:(context,state)=>AddListScreen(),
      ),
    ],
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
            selectedItemColor:AppColors.primaryColor,
            type:BottomNavigationBarType.fixed,
            items:_navItems,
            currentIndex:_getIndexBasedOnLocation(state.matchedLocation),
            onTap:(index)=>context.go(_routesMap[index]),
          ),
        );
      },
      routes:_routes,
    ),
    GoRoute(
      path:'/login',
      builder:(context,state)=>LoginScreen(),
    ),
    GoRoute(
      path:'/register',
      builder:(context,state)=>RegisterScreen(),
    ),
  ],
);
