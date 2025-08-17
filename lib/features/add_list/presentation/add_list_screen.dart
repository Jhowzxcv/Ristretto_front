import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

class AddListScreen extends StatefulWidget{
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

enum ListType{normal,periodic}

class _AddListScreenState extends State<AddListScreen> {
  ListColor selectedListColor=ListColor.listColorA;
  ListType selectedListType=ListType.normal;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(32),
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
            children:ListColor.values.map(
              (listColor)=>Expanded(
                flex:1,
                child: GestureDetector(
                  onTap:(){
                    setState((){
                      selectedListColor=listColor;
                    });
                  },
                  child: AspectRatio(
                    aspectRatio:1,
                    child: Container(
                      decoration:BoxDecoration(
                        color:listColor.color,
                        borderRadius:BorderRadius.circular(4),
                        border:BoxBorder.all(
                          color:listColor==selectedListColor?darken(listColor.color,0.65):Colors.transparent,
                          width:2.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ).toList(),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                    materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
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
                    materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text('Periódico'),
                ],
              ),
            ],
          ),
          if(selectedListType==ListType.normal) Text('hi')
          else Text('bye')
        ],
      ),
    );
  }
}
