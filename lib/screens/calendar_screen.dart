import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(
            padding:const EdgeInsets.fromLTRB(16,16,16,0),
            child: Column(
              children:[
                Text(
                  'Julho',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:26,
                  ),
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  spacing:4,
                  children:[
                    Icon(Icons.arrow_left,color:Colors.blue[500]),
                    Text(
                      'Hoje',
                      style:TextStyle(
                        color:Colors.blue[500],
                      ),
                    ),
                    Icon(Icons.arrow_right,color:Colors.blue[500]),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child:Container(
              margin:const EdgeInsets.all(16),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(6),
                border:BoxBorder.all(color:Colors.grey[400]!,width:2),
              ),
            )
          ),
        ],
      );
  }
}
