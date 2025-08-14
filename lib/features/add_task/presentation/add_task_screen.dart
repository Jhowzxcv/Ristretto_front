import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/features/add_task/presentation/add_task_list.dart';

import 'package:ristretto/mock.dart';

class AddTaskScreen extends StatelessWidget{
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(16),
      child: Column(
        spacing:16,
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Text(
                'Lista de Listas',
                style:Theme.of(context).textTheme.headlineLarge,
              ),
              Icon(Icons.edit),
            ],
          ),
          Expanded(
            child:GridView.count(
              crossAxisCount:2,
              mainAxisSpacing:8,
              crossAxisSpacing:8,
              children:List.generate(
                listsSkeleton.length+1,
                (index)=>index!=listsSkeleton.length
                  ?ListSkeleton(listsSkeleton[index])
                  :GestureDetector(
                    onTap:(){
                      context.go('/add-task/add-list');
                    },
                    child: Container(
                      color:Color(0xFFEEEEEE),
                      child:Expanded(
                        child: FractionallySizedBox(
                          heightFactor:0.25,
                          child:Icon(Icons.add,size:50),
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
