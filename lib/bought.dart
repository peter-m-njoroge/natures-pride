import 'package:flutter/material.dart';
import 'package:newpeter/buy.dart';

class MyBought extends StatefulWidget {
  static const routName = '/reciept';
  MyBought({Key? key}) : super(key: key);
  @override
  State<MyBought> createState() => MyBoughtState();
}

class MyBoughtState extends State<MyBought> {
  static List<GlobalKey<TroubState>> keysList = [];
  List<String> selectedItems = [];
  static List<Flower> prods = [];
  List<int> tots = [];
  static int alltotal = 0;
  bool pressed = false;
  int newtotal = 0;
  @override
  Widget build(BuildContext context) {
    var selectedItem = ModalRoute.of(context)?.settings.arguments;
    selectedItems = selectedItem as List<String>;
    for (int count = 0; count <= selectedItems.length; count++) {
      keysList.add(GlobalKey<TroubState>());
    }
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("Reciept"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      child: Troub(
                          key: keysList[index],
                          itemNo: index,
                          selectedItem: selectedItems[index],
                          price: 100));
                },
              ),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  int to = 0;
                  for (Flower one in prods) {
                    one.total = keysList[prods.indexOf(one)].currentState!.totl;
                    to = to + one.total;
                    if (to != newtotal) {
                      newtotal = to;
                    }
                  }
                  setState(() {
                    if (newtotal != alltotal) {
                      alltotal = newtotal;
                    }
                  });
                },
                child: const Text("Totals"),
              ),
              Text("$alltotal"),
              const Spacer(),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.mail_outline),
                  label: const Text(
                    "Make Order",
                    style: TextStyle(color: Colors.black54),
                  ))
            ],
          ),
        ));
  }
}

class Troub extends StatefulWidget {
  String selectedItem;
  int price;
  int itemNo;
  static int pricee = 0;
  static String namee = "";

  Troub(
      {Key? key,
      required this.selectedItem,
      required this.price,
      required this.itemNo})
      : super(key: key) {
    pricee = price;
    namee = selectedItem;
  }
  static String getname() {
    return namee;
  }

  static int getprice() {
    return pricee;
  }

  @override
  TroubState createState() => TroubState();
}

class TroubState extends State<Troub> {
  Flower prod = Flower(Troub.getname(), Troub.getprice());
  var totl = 100;

  TroubState() {
    MyBoughtState.prods.add(prod);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 40.0,
            color: Colors.blue,
            child: Text(
              widget.selectedItem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                inherit: false,
                color: Colors.red,
                backgroundColor: Colors.cyan,
              ),
            ),
          ),
          Text("${prod.gettotal()}/="),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${prod.amount}'),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (prod.amount > 1) {
                      prod.removeone();
                      totl = prod.gettotal();
                    }
                  });
                },
                tooltip: "Remove 1 ${prod.name} From Cart",
                color: Colors.red,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    prod.addone();
                    totl = prod.gettotal();
                  });
                },
                tooltip: "Add another ${prod.name}",
                color: Colors.red,
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Flower {
  int price = 100;
  String name = "";
  int total = 0;
  int amount = 1;
  Flower(this.name, this.price) {
    total = amount * price;
  }

  void addone() {
    amount = amount + 1;
  }

  void removeone() {
    amount = amount - 1;
  }

  int gettotal() {
    total = amount * price;
    return total;
  }
}
