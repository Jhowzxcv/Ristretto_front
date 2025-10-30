import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget{
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisSize:MainAxisSize.max,
        children:[
          Text('Timer',style:TextStyle(
            fontSize:26,
          )),
          ElevatedButton(
            onPressed:(){},
            child:Text('Atribuir a uma tarefa'),
          ),
          Expanded(
            child:Icon(Icons.blender),
          ),
          Text('Tempo',style:TextStyle(
            fontSize:20,
          )),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed:null,
                child:Text('00'),
              ),
              ElevatedButton(
                onPressed:null,
                child:Text('30'),
              ),
              ElevatedButton(
                onPressed:null,
                child:Text('00'),
              ),
            ],
          ),
          RawMaterialButton(
            onPressed:(){},
            child:Text('Configurar pausas'),
          ),
          ElevatedButton(
            onPressed:(){},
            style:ElevatedButton.styleFrom(
              backgroundColor:Colors.blue[100],
            ),
            child:Text('Iniciar',style:TextStyle(
              color:Colors.white,
            )),
          ),
        ],
      ),
    );
  }
}
