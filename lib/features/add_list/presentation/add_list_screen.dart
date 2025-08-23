import 'package:flutter/material.dart';
import 'package:ristretto/core/commons/widgets/the_checkbox.dart';
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
      padding:const EdgeInsets.all(48),
      child: Column(
        children:[
          Text(
            'Nova Lista',
            style:Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height:32),
          Container(
            width:120,
            height:120,
            decoration:BoxDecoration(
              color:selectedListColor.color,
              shape:BoxShape.circle,
            ),
            child:Icon(Icons.square),
          ),
          SizedBox(height:32),
          TextField(
            textAlign:TextAlign.center,
            style:Theme.of(context).textTheme.headlineMedium,
            decoration:InputDecoration(
              filled:true,
              fillColor:selectedListColor.color,
              hintText:'Nome da Lista',
            ),
          ),
          SizedBox(height:24),
          Row(
            mainAxisSize:MainAxisSize.max,
            spacing:8,
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
          SizedBox(height:24),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Row(
                spacing:8,
                children:[
                  TheCheckbox(
                    toggleState:(){
                      setState((){
                        selectedListType=ListType.normal;
                      });
                    },
                    isChecked:selectedListType==ListType.normal,
                  ),
                  Text('Padrão',style:Theme.of(context).textTheme.headlineMedium),
                ],
              ),
              Row(
                spacing:8,
                children: [
                  TheCheckbox(
                    toggleState:(){
                      setState((){
                        selectedListType=ListType.periodic;
                      });
                    },
                    isChecked:selectedListType==ListType.periodic,
                  ),
                  Text('Periódico',style:Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ],
          ),
          SizedBox(height:28),
          if(selectedListType==ListType.normal)
            Container(
              child:Column(
                children:[
                  Text(
                    'Data para conclusão (opcional)',
                    style:Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children:[
                      Column(
                        children:[
                          Text('dia'),
                          Container(
                            child:Text('dd'),
                          ),
                        ]
                      ),
                      Column(
                        children:[
                          Text('mês'),
                          Container(
                            child:Text('mm'),
                          ),
                        ]
                      ),
                      Column(
                        children:[
                          Text('ano'),
                          Container(
                            child:Text('aaaa'),
                          ),
                        ]
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Container(
              child:Column(
                children:[
                  Row(
                    children:[
                      Text('Repetir a cada'),
                      // TextField(),
                      // TextField(),
                    ],
                  ),
                  Row(
                    children:[
                      TheCheckbox(
                        isChecked:false,
                        toggleState:(){},
                      ),
                      Text('Modo Repetição Automática'),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
