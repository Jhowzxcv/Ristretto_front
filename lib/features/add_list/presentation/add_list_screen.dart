import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

class AddListScreen extends StatefulWidget{
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

enum ListType{normal,periodic}

class _AddListScreenState extends State<AddListScreen> {
  ListType selectedListType=ListType.normal;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(16),
      child: Column(
        children:[
          Text(
            'Nova Lista',
            style:Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            width:50,
            height:50,
            decoration:BoxDecoration(
              color:AppColors.listColorA,
              shape:BoxShape.circle,
            ),
            child:Icon(Icons.square),
          ),
          TextField(),
          Row(
            mainAxisSize:MainAxisSize.max,
            spacing:4,
            children:List.generate(
              listsColor.length,
              (index)=>GestureDetector(
                onTap:(){
                  setState((){
                    
                  });
                },
                child: Expanded(
                  flex:1,
                  child: AspectRatio(
                    aspectRatio:1,
                    child: Container(
                      decoration:BoxDecoration(
                        color:listsColor[index],
                        borderRadius:BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children:[
              Row(
                children:[
                  Radio(
                    value:ListType.normal,
                    groupValue:selectedListType,
                    onChanged:(value){
                      setState((){
                        selectedListType=ListType.normal;
                      });
                    },
                  ),
                  Text('Padrão'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value:ListType.periodic,
                    groupValue:selectedListType,
                    onChanged:(value){
                      setState(() {
                        selectedListType=ListType.periodic;
                      });
                    },
                  ),
                  Text('Periódico'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
