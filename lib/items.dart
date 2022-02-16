import 'package:flutter/material.dart';

class MyItem extends StatefulWidget {
  static const routName = '/myitem';
  String item;
  String disp;
  static List<String> selectedItems = [];
  MyItem({Key? key, required this.item, required this.disp}) : super(key: key);

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  var pressed = Colors.red;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.item),
              Image.asset(
                widget.disp,
                fit: BoxFit.fitHeight,
                frameBuilder: (BuildContext context, Widget child, _,
                    bool wasSynchronouslyLoaded) {
                  return SizedBox(
                    height: 100,
                    width: 400,
                    child: child,
                  );
                },
              ),
              const Text("100 /="),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: isPressed ? pressed : null,
                    onPressed: () {
                      if (!isPressed) {
                        MyItem.selectedItems.add(widget.item);
                        setState(() {
                          isPressed = true;
                        });
                      } else {}
                    },
                    tooltip: 'Add to Cart',
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                  IconButton(
                    onPressed: () {
                      MyItem.selectedItems.remove(widget.item);
                      setState(() {
                        isPressed = false;
                      });
                    },
                    tooltip: 'Remove from  Cart',
                    icon: const Icon(Icons.cancel),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
