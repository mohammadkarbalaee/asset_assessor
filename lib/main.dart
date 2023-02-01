import 'package:asset_assessor/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AssetAssessor());
}

class AssetAssessor extends StatelessWidget {
  AssetAssessor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
