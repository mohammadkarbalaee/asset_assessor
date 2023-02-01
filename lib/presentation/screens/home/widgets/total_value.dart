import 'package:asset_assessor/data/providers/web/scraper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TotalValue extends StatelessWidget {
  TotalValue({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getValues(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            double usd = snapshot.data!["usd"]!;
            double eur = snapshot.data!["eur"]!;
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
                  child: Image.asset('assets/images/rial.jpg'),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                Text(
                  '${intl.NumberFormat.decimalPattern().format(usd * 1400 + 550 * eur)}\ufdfc',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
