import 'package:flutter/material.dart';

class Cost extends StatefulWidget {
  const Cost({Key? key}) : super(key: key);

  @override
  _CostState createState() => _CostState();
}

class _CostState extends State<Cost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("Reciept"),
      ),
    );
  }
}
