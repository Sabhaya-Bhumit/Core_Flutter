import 'package:flutter/material.dart';
import 'package:invoice/add_costomer.dart';
import 'package:invoice/add_pro.dart';
import 'package:invoice/all_product.dart';
import 'package:invoice/global.dart';
import 'package:invoice/pdf_page.dart';
import 'package:invoice/product.dart';
import 'package:invoice/space_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'hi',
      routes: {
        'hi': (context) => home2(),
        '/': (context) => home(),
        'add_customer': (context) => add_customer(),
        'product': (context) => product(),
        'add_pro': (context) => add_pro(),
        'all_product': (context) => all_product(),
        'pdf_page': (context) => pdf_page(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("You Exit"),
                content: Text("walcome back"),
                actions: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.purple)),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(fontSize: 20),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop(false);
                        });
                      },
                      child: Text(
                        "No",
                        style: TextStyle(fontSize: 20, color: Colors.purple),
                      ))
                ],
              )),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Invoice"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed('add_customer');
            });
          },
          child: Icon(Icons.add),
        ),
        body: (global.coustomers.isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.no_meals, size: 120),
                    Text(
                      "add is",
                      style: TextStyle(fontSize: 50, color: Colors.grey),
                    ),
                  ],
                ))
            : Scrollbar(
                child: ListView.separated(
                    separatorBuilder: (context, i) => SizedBox(height: 10),
                    padding: EdgeInsets.all(20),
                    itemCount: global.coustomers.length,
                    itemBuilder: (context, i) => InkWell(
                          onTap: () {
                            setState(() {
                              print("wjnv${global.coustomers[i].productss}");
                              global.pdf_page_count = i;
                              Navigator.of(context)
                                  .pushNamed('pdf_page', arguments: i);
                            });
                          },
                          child: Container(
                            height: 150,
                            color: Colors.purple,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " name: ${global.coustomers[i].fisrt_name} ${global.coustomers[i].last_name}\n\n phone:${global.coustomers[i].phone}"
                                  "\n\n          Click In To You Invoice ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ))),
      ),
    );
  }
}
