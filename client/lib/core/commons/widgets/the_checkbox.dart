import 'package:flutter/material.dart';

class TheCheckbox extends StatelessWidget{
  final bool isChecked;
  final void Function() toggleState;

  const TheCheckbox({
    super.key,
    required this.isChecked,
    required this.toggleState,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:toggleState,
      child:SizedBox(
        height:20,
        child:AspectRatio(
          aspectRatio:1,
          child:Container(
            decoration:BoxDecoration(
              shape:BoxShape.circle,
              border:Border.all(
                color:Colors.black,
                width:1.5,
              ),
            ),
            child:FractionallySizedBox(
              widthFactor:0.8,
              child: AspectRatio(
                aspectRatio:1,
                child:Container(
                  decoration:BoxDecoration(
                    color:isChecked?Colors.black:Colors.transparent,
                    shape:BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
