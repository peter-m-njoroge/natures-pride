import 'package:flutter/material.dart';
import 'package:newpeter/buy.dart';
import 'package:newpeter/items.dart';

class MyHomePage extends StatefulWidget {
  static const routName = '/home';
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> selectedItems = MyItem.selectedItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Our Products",
          style: TextStyle(
            fontSize: 19.0,
            inherit: false,
            color: Colors.red,
            backgroundColor: Colors.lightGreenAccent,
          ),
          textAlign: TextAlign.right,
        ),
        leading: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
          color: Colors.black87,
          child: ListView(
            children: [
              MyItem(item: "Roseflower", disp: "./assets/rose.jpg"),
              MyItem(item: "African Daisy", disp: "./assets/afri_daisy.jpg"),
              MyItem(item: "Carnation", disp: "./assets/carnation.jpg"),
              MyItem(item: "Geraniums", disp: "./assets/geraniums.jpg"),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(MyScreen2.routName, arguments: selectedItems);
                },
                child: const Text("View Cart"),
              ),
            ],
          )),
    );
  }
}
