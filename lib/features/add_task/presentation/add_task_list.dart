import 'package:flutter/material.dart';

import 'package:ristretto/core/models/ilist_skeleton.dart';

class ListSkeleton extends StatelessWidget{
  final IListSkeleton listSimple;

  const ListSkeleton(
    this.listSimple,
    {
      super.key,
    }
  );

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
                style:Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
  }
}

