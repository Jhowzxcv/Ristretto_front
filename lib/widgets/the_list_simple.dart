import 'package:flutter/material.dart';
import 'package:ristretto/models/list_simple.dart';

class TheListSimple extends StatelessWidget{
  const TheListSimple(this.listSimple);

  final ListSimple listSimple;

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding:const EdgeInsets.all(16),
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(6),
          color:listSimple.color,
        ),
        child: Column(
          mainAxisSize:MainAxisSize.max,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            Expanded(
              child: FittedBox(
                fit:BoxFit.contain,
                child: Icon(listSimple.icon,size:50),
              ),
            ),
            Align(
              alignment:Alignment.center,
              child: Text(
                listSimple.title,
                style:TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
  }
}

