import 'package:flutter/material.dart';

class TheTask extends StatelessWidget{
  const TheTask({super.key,required this.title,required this.deadline});

  final String title;
  final String deadline;

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Text(title),
            Text(
              deadline,
              style:TextStyle(
                color:Colors.blueGrey[600],
                fontSize:14,
              ),
            ),
          ],
        ),
        Checkbox(
          value:false,
          onChanged:null,
          shape:const CircleBorder(),
          side:const BorderSide(
            color:Colors.black,
            width:1.5,
          ),
        ),
      ],
    );
  }
}
