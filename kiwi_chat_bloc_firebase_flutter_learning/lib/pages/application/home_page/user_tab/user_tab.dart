import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 100,
          itemBuilder: (context, index) =>  Container(

          ),)
    );
  }
}
