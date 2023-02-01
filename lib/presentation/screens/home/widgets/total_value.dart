import 'package:flutter/material.dart';

class TotalValue extends StatelessWidget {
  TotalValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                'assets/images/rial.jpg'
              ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25)
            ),
          ),
        ),
        Text(
          '250 \ufdfc',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ],
    );
  }
}