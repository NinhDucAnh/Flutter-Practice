import 'package:flutter/material.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/application_page.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/home_page/home_page.dart';
Widget buildPage(int index){
  List<Widget> widgets =[
    const HomePage(),
    const Text('duc anh'),
    const Text('duc anh2'),
  ];
  return widgets[index];
}