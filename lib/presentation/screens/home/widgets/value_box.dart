import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ValueBox extends StatelessWidget {
  final double valueToShow;
  final String currency;
  final String currencyLogo;

  const ValueBox(
      {super.key,
      required this.valueToShow,
      required this.currency,
      required this.currencyLogo});

  @override
  Widget build(BuildContext context) {
    String text =
        '${intl.NumberFormat.decimalPattern().format(valueToShow)}$currencyLogo';
    if (currency == "euro") {
      text =
          '$currencyLogo${intl.NumberFormat.decimalPattern().format(valueToShow)}';
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Image.asset(
              'assets/images/${currency}.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Opacity(
          opacity: 0.55,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25)),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
      ],
    );
  }
}
