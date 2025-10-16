import 'package:flutter/material.dart';

class ListSkeleton extends StatelessWidget{
  final String name;
  final String color;

  const ListSkeleton({super.key,required this.name,required this.color});

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF'); // default alpha
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding:const EdgeInsets.all(16),
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(8),
          color:fromHex(color),
        ),
        child: Column(
          mainAxisSize:MainAxisSize.max,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            Expanded(
              child: FittedBox(
                fit:BoxFit.contain,
                // child: Icon(listSimple.icon,size:50),
                child:Icon(Icons.school),
              ),
            ),
            Align(
              alignment:Alignment.center,
              child: Text(
                name,
                style:Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      );
  }
}

