import 'package:flutter/material.dart';

class TotalValue extends StatelessWidget {
  TotalValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(
        '250 \ufdfc',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white
        ),
      ),
    );
  }
}