import 'package:flutter/material.dart';
import 'package:newpeter/bought.dart';

class MyScreen2 extends StatefulWidget {
  static const routName = '/buyscreen';
  MyScreen2({Key? key}) : super(key: key);

  @override
  _MyScreen2State createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {
  List<String> selectedItems = [];
  void setMe() {}
  @override
  Widget build(BuildContext context) {
    var selectedItem = ModalRoute.of(context)?.settings.arguments;
    selectedItems = selectedItem as List<String>;

    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("Back To Add Or Remove Items"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedItems[index],
                        textAlign: TextAlign.start,
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(
                  MyBought.routName,
                  arguments: selectedItems,
                );
              },
              child: const Text("See Reciept"),
            )
          ],
        ));
  }
}
