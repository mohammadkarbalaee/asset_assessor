import 'package:asset_assessor/data/providers/web/scraper.dart';
import 'package:asset_assessor/presentation/screens/home/widgets/value_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

String dollarSign = "\u0024";
String euroSign = "\u20ac";
String rialSign = "\ufdfc";

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int fakeVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          setState(() {
            fakeVal++;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal
        ),
        child: Text('Refresh'),
      ), 
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Asset Assessor",
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: FutureBuilder(
            future: getValues(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                double usd = snapshot.data!["usd"]!;
                double eur = snapshot.data!["eur"]!;
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ValueBox(
                          valueToShow: 0,
                          currency: "dollar",
                          currencyLogo: dollarSign),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.teal,
                        ),
                      ),
                      ValueBox(
                          valueToShow: 7000,
                          currency: "euro",
                          currencyLogo: euroSign),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(
                          Icons.public,
                          color: Colors.teal,
                          size: 30,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '1${dollarSign} = ${intl.NumberFormat.decimalPattern().format(usd)}$rialSign',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              '${euroSign}1 = ${intl.NumberFormat.decimalPattern().format(eur)}$rialSign',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.teal,
                          size: 30,
                        ),
                      ),
                      ValueBox(
                          valueToShow: 0 * usd + 7000 * eur,
                          currency: "rial",
                          currencyLogo: rialSign),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                );
              }
            }),
      ),
    );
  }
}
