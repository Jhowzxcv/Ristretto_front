import 'package:flutter/material.dart';

import 'package:ristretto/core/routes/router.dart';
import 'package:ristretto/core/themes/light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner:false,
      routerConfig:router,
      theme:lightTheme,
    );
  }
}
