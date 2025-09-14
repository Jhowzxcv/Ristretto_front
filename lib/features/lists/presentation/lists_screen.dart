import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ristretto/features/lists/presentation/add_task_list.dart';

import 'package:ristretto/mock.dart';

class ListsScreen extends StatelessWidget{
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(24),
      child: Column(
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              // Title
              Text(
                'Listas',
                style:Theme.of(context).textTheme.headlineLarge,
              ),
              // Button to Edit List
              Icon(Icons.edit),
            ],
          ),
          Expanded(
            child:GridView.count(
              crossAxisCount:2,
              mainAxisSpacing:10,
              crossAxisSpacing:10,
              children:List.generate(
                listsSkeleton.length+1,
                (index)=>index!=listsSkeleton.length
                  // Render List
                  ?ListSkeleton(listsSkeleton[index])
                  // Button to Add New List
                  :GestureDetector(
                    onTap:()=>context.go('/add-list'),
                    child: Container(
                      decoration:BoxDecoration(
                        color:Color(0xFFEEEEEE),
                        borderRadius:BorderRadius.circular(8),
                      ),
                      child: FractionallySizedBox(
                        heightFactor:0.25,
                        child:Icon(Icons.add,size:50),
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
