import 'package:flutter/material.dart';
import 'package:invoice/global.dart';

class all_product extends StatefulWidget {
  const all_product({Key? key}) : super(key: key);

  @override
  State<all_product> createState() => _all_productState();
}

class _all_productState extends State<all_product> {
  late List productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count_price();
  }

  List bhumit = [];

  count_price() async {
    setState(() {
      global.total_count = 0;
      global.total_price = 0;
      for (int i = 0; i < global.all_pro.length; i++) {
        global.total_count = global.total_count + global.all_pro[i]['count'];
        global.total_price = global.total_price +
            (global.all_pro[i]['count'] * global.all_pro[i]['price']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("You Product Is Select "),
        centerTitle: true,
        elevation: 0,
        leading: Container(),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (global.all_pro.length >= 0) {
                    productList = global.all_pro;
                    global.pro.add(global.all_pro);
                    global.coustomers[global.nullss].productss = productList;
                    print(global.coustomers[global.nullss].productss);
                    global.coustomers[global.nullss].productss =
                        global.pro[global.nullss];
                    global.coustomers[global.nullss].totals =
                        global.total_price.toInt();
                    global.coustomers[global.nullss].count =
                        global.total_count.toInt();

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }
                });
              },
              icon: Icon(Icons.picture_as_pdf)),
        ],
      ),
      body: Scrollbar(
        interactive: true,
        thickness: 10,
        trackVisibility: true,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: global.all_pro.length,
                itemBuilder: (context, i) => Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${global.all_pro[i]['image']}",
                            height: 80,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "price is ${global.all_pro[i]['price']}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                "${global.all_pro[i]['name']}",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.purple)),
                                        onPressed: () {
                                          setState(() {
                                            global.total_count++;
                                            global.all_pro[i]['count']++;
                                            global.total_price =
                                                global.total_price +
                                                    global.all_pro[i]['price'];
                                          });
                                        },
                                        child: Text(
                                          "+",
                                          style: TextStyle(fontSize: 25),
                                        )),
                                    Text(
                                      "${global.all_pro[i]['count']}",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.purple)),
                                        onPressed: () {
                                          setState(() {
                                            if (global.all_pro[i]['count'] <=
                                                1) {
                                              global.all_pro[i]['count'] = 1;
                                            } else {
                                              global.all_pro[i]['count']--;
                                              global.total_count--;
                                              global.total_price = global
                                                      .total_price -
                                                  global.all_pro[i]['price'];
                                            }
                                          });
                                        },
                                        child: Text(
                                          "-",
                                          style: TextStyle(fontSize: 30),
                                        )),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      global.all_pro[i]['bool'] = true;
                                      global.list_count--;
                                      global.all_pro.remove(global.all_pro[i]);
                                      global.total_count = 0;
                                      global.total_price = 0;
                                      for (int i = 0;
                                          i < global.all_pro.length;
                                          i++) {
                                        global.total_count =
                                            global.total_count +
                                                global.all_pro[i]['count'];
                                        global.total_price =
                                            global.total_price +
                                                (global.all_pro[i]['count'] *
                                                    global.all_pro[i]['price']);
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total count is ${global.total_count.toInt()}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Total Price is ${global.total_price.toInt()}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
