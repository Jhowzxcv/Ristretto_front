import 'package:flutter/material.dart';

import 'package:ristretto/mock.dart';
import 'package:ristretto/widgets/the_list_simple.dart';

class AddTaskScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children:[
        Padding(
          padding:const EdgeInsets.fromLTRB(16,16,16,0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Text(
                'Lista de Listas',
                style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:26,
                ),
              ),
              Icon(Icons.add),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount:2,
              mainAxisSpacing:8,
              crossAxisSpacing:8,
              children:List.generate(
                listsSimple.length,
                (index)=>TheListSimple(listsSimple[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
