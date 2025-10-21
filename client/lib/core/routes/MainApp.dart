import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/core/themes/colors.dart';

// Navigation Bar Items
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

// Main App with Common Navigation Bar
class MainApp extends StatelessWidget{
  const MainApp({
    super.key,
    required this.navigationShell
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:navigationShell,
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor:AppColors.primaryColor,
        type:BottomNavigationBarType.fixed,
        items:_navItems,
        currentIndex:navigationShell.currentIndex,
        onTap:(index)=>
          navigationShell.goBranch(
            index,
            initialLocation:index==navigationShell.currentIndex,
          ),
      ),
    );
  }
}
