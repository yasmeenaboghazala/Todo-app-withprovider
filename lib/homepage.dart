import 'package:credit/cart.dart';
import 'package:credit/check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<item> items = [
    item("oppo a1k", 250),
    item("p30 pro", 230),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const check();
                          }));
                        },
                        icon: const Icon(Icons.add_shopping_cart)),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Consumer<cert>(builder: (context, cert, child) {
                        return Text("${cert.count}");
                      }),
                    )
                  ],
                )
              ],
            ),
            body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: Consumer<cert>(builder: (context, cert, child) {
                    return ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              cert.add(items[i]);
                            },
                            icon: const Icon(Icons.add)),
                        title: Text(items[i].name));
                  }));
                })));
  }
}

class item {
  String name;
  double price;
  item(this.name, this.price);
}
