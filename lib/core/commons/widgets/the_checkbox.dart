import 'package:flutter/material.dart';

class TheCheckbox extends StatelessWidget{
  final bool initialValue;
  final void Function() toggleState;

  const TheCheckbox({
    super.key,
    required this.initialValue,
    required this.toggleState,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:toggleState,
      child: FractionallySizedBox(
        heightFactor:0.5,
        child:AspectRatio(
          aspectRatio:1,
          child: Container(
            decoration:BoxDecoration(
              color:initialValue?Colors.black:Colors.transparent,
              shape:BoxShape.circle,
              border: Border.all(
                color:Colors.black,
                width:1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
