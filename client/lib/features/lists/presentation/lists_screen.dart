import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ristretto/core/models/icategory.dart';
import 'package:ristretto/core/services/category.dart';

import 'package:ristretto/features/lists/presentation/add_task_list.dart';

class ListsScreen extends StatefulWidget{
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState()=>_ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen>{
  bool _isLoading=true;
  List<ICategory> categories=[];

  Future<void> fetchInitialData()async{
    debugPrint('start');

    List<ICategory> result=await CategoryService.instance.getCategories();

    for (var category in result) {
      debugPrint(category.name);
    }

    setState((){
      categories=result;
      _isLoading=false;
    });

    debugPrint('ok');
  }

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  @override
  Widget build(BuildContext context){
    return 
      _isLoading
      ?Center(
        child:CircularProgressIndicator(),
      )
      :Padding(
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
                  categories.length+1,
                  (index)=>index!=categories.length
                    // Render List
                    ?ListSkeleton(
                      name:categories[index].name,
                      color:categories[index].color,
                    )
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
