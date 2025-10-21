import 'package:flutter/material.dart';
import 'package:ristretto/core/themes/colors.dart';

import 'package:ristretto/core/services/category.dart';

class AddListScreen extends StatefulWidget{
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState()=>_AddListScreenState();
}

class IListFormState{
  String name='';
  ListColor selectedListColor=ListColor.listColorA;
}

class _AddListScreenState extends State<AddListScreen>{
  IListFormState _listFormState=IListFormState();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  Future<void> _addList()async{
    _formKey.currentState!.save();

    await CategoryService.instance.create(
      name:_listFormState.name,
      listColor:_listFormState.selectedListColor,
    );
  }

  // Title
  Text _buildTitle(BuildContext context){
    return Text(
      'Nova Lista',
      style:Theme.of(context).textTheme.headlineLarge,
      textAlign:TextAlign.center,
    );
  }

  // Select Icon
  Container _buildIconInput(){
    return Container(
      width:120,
      height:120,
      decoration:BoxDecoration(
        color:_listFormState.selectedListColor.color,
        shape:BoxShape.circle,
      ),
      child:Icon(Icons.square),
    );
  }

  // Text Field to Enter new List Title
  TextFormField _buildNameInput(BuildContext context){
    return TextFormField(
      onSaved:(newValue)=>_listFormState.name=newValue!,
      textAlign:TextAlign.center,
      style:Theme.of(context).textTheme.headlineMedium!.copyWith(
        color:Colors.black,
        fontWeight:FontWeight.w700
      ),
      decoration:InputDecoration(
        filled:true,
        fillColor:_listFormState.selectedListColor.color,
        hintText:'Nome da Lista',
        hintStyle:TextStyle(
          color:Colors.black,
        ),
        enabledBorder:OutlineInputBorder(
          borderSide:BorderSide(width:0,color:_listFormState.selectedListColor.color),
          borderRadius:BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Select New List Color from Range
  Row _buildColorInput(){
    return Row(
      mainAxisSize:MainAxisSize.max,
      spacing:8,
      children:ListColor.values.map(
        (listColor)=>Expanded(
          flex:1,
          child: GestureDetector(
            onTap:()=>setState(()=>_listFormState.selectedListColor=listColor),
            child:AspectRatio(
              aspectRatio:1,
              child: Container(
                decoration:BoxDecoration(
                  color:listColor.color,
                  borderRadius:BorderRadius.circular(4),
                  border:BoxBorder.all(
                    color:listColor==_listFormState.selectedListColor
                      ?darken(listColor.color,0.65)
                      :Colors.transparent,
                    width:2.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          _buildTitle(context),
          SizedBox(height:32),
          Form(
            key:_formKey,
            child:Column(
              children:[
                _buildIconInput(),
                SizedBox(height:32),
                _buildNameInput(context),
                SizedBox(height:24),
                _buildColorInput(),
                FilledButton(
                  onPressed:_addList,
                  child:Text('Adicionar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
