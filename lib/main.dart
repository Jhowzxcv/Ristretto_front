import 'package:flutter/material.dart';

import 'package:ristretto/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner:false,
      routerConfig:router,
    );
  }
}
