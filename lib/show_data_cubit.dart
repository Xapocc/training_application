import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDataCubit extends Cubit<Widget> {
  ShowDataCubit() : super(Container());

  void loading() => emit(Center(child: Container(color: Colors.amber,),));
  void loaded() => emit(Center(child: Container(color: Colors.green,),));
  void error() => emit(Center(child: Container(color: Colors.red,),));
}