import 'package:flutter/material.dart';
import 'package:invoice/global.dart';

class add_pro extends StatefulWidget {
  const add_pro({Key? key}) : super(key: key);

  @override
  State<add_pro> createState() => _add_proState();
}

class _add_proState extends State<add_pro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // global.all_pro.length;
  }

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
            backgroundColor: Colors.purple,
            title: Text("Product"),
            centerTitle: true,
            elevation: 0,
            leading: Container()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed('all_product');
            });
          },
          child: Column(
            children: [
              Text("   ${global.list_count}"),
              Icon(Icons.production_quantity_limits),
            ],
          ),
          backgroundColor: Colors.purple,
        ),
        body: Scrollbar(
            child: ListView.builder(
                itemCount: global.all_product.length,
                itemBuilder: (context, i) => Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .pushNamed('product', arguments: i);
                              });
                            },
                            child: Column(
                              children: [
                                // CircularProgressIndicator(),
                                Container(
                                  height: 150,
                                  color: Colors.purple,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "${global.all_product[i]['image']}",
                                          height: 150),
                                      Spacer(),
                                      Text(
                                        "${global.all_product[i]['name']}",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
      ),
    );
  }
}
