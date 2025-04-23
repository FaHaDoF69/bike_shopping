import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDesigneTbn extends StatelessWidget {
  Icon icons;
  MyDesigneTbn({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      //color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color: Colors.red,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF34c8e8), Color(0xFF4e4af2)],
        ),
      ),
      child: icons,
    );
  }
}
