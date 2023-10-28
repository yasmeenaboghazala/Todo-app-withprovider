import 'package:credit/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class check extends StatefulWidget {
  const check({super.key});

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("check out"),
        ),
        body: Consumer<cert>(builder: (context, cert, child) {
          return ListView.builder(
              itemCount: cert.baskitem.length,
              itemBuilder: (context, i) {
                return Card(
                    child: ListTile(
                        title: Text(cert.baskitem[i].name),
                        trailing: IconButton(
                          onPressed: () {
                            cert.remove(cert.baskitem[i]);
                          },
                          icon: const Icon(Icons.remove_circle),
                        )));
              });
        }));
  }
}
