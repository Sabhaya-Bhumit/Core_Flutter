import 'package:flutter/material.dart';
import 'package:invoice/global.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Text("Product"),
          backgroundColor: Colors.purple,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed('all_product');
                });
              },
              icon: Column(
                children: [
                  Text("   ${global.list_count}"),
                  Icon(Icons.production_quantity_limits),
                ],
              ),
            ),
          ],
          elevation: 0,
          leading: Container()),
      body: Scrollbar(
          child: IndexedStack(
        index: res,
        children: [
          //fruits
          ListView.builder(
            itemCount: global.fruts.length,
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "${global.fruts[i]['image']}",
                            height: 80,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "price is ${global.fruts[i]['price']}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "${global.fruts[i]['name']}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
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
                                        global.fruts[i]['count']++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(fontSize: 25),
                                    )),
                                SizedBox(width: 1),
                                Text(
                                  "${global.fruts[i]['count']}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 1),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.purple)),
                                    onPressed: () {
                                      setState(() {
                                        if (global.fruts[i]['count'] <= 1) {
                                          global.fruts[i]['count'] = 1;
                                        } else {
                                          global.fruts[i]['count']--;
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
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (global.fruts[i]['bool'] == true) {
                                  global.all_pro.add(global.fruts[i]);
                                  global.list_count++;
                                }
                                global.fruts[i]['bool'] = false;
                              });
                            },
                            child: Text(
                              "add",
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.purple)),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          //kitchen
          ListView.builder(
            itemCount: global.Kitchen.length,
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "${global.Kitchen[i]['image']}",
                            height: 80,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "price is ${global.Kitchen[i]['price']}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "${global.Kitchen[i]['name']}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
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
                                        global.Kitchen[i]['count']++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(fontSize: 25),
                                    )),
                                SizedBox(width: 1),
                                Text(
                                  "${global.Kitchen[i]['count']}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 1),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.purple)),
                                    onPressed: () {
                                      setState(() {
                                        if (global.Kitchen[i]['count'] <= 1) {
                                          global.Kitchen[i]['count'] = 1;
                                        } else {
                                          global.Kitchen[i]['count']--;
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
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (global.Kitchen[i]['bool'] == true) {
                                  global.all_pro.add(global.Kitchen[i]);
                                  global.list_count++;
                                }
                                global.Kitchen[i]['bool'] = false;
                              });
                            },
                            child: Text(
                              "add",
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.purple)),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          //schoool
          ListView.builder(
            itemCount: global.school.length,
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "${global.school[i]['image']}",
                            height: 80,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "price is ${global.school[i]['price']}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "${global.school[i]['name']}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
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
                                        global.school[i]['count']++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(fontSize: 25),
                                    )),
                                SizedBox(width: 1),
                                Text(
                                  "${global.school[i]['count']}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 1),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.purple)),
                                    onPressed: () {
                                      setState(() {
                                        if (global.school[i]['count'] <= 1) {
                                          global.school[i]['count'] = 1;
                                        } else {
                                          global.school[i]['count']--;
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
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (global.school[i]['bool'] == true) {
                                  global.all_pro.add(global.school[i]);
                                  global.list_count++;
                                }
                                global.school[i]['bool'] = false;
                              });
                            },
                            child: Text(
                              "add",
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.purple)),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          //ice
          ListView.builder(
            itemCount: global.ice.length,
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "${global.ice[i]['image']}",
                            height: 80,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "price is ${global.ice[i]['price']}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "${global.ice[i]['name']}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
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
                                        global.ice[i]['count']++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(fontSize: 25),
                                    )),
                                SizedBox(width: 1),
                                Text(
                                  "${global.ice[i]['count']}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 1),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.purple)),
                                    onPressed: () {
                                      setState(() {
                                        if (global.ice[i]['count'] <= 1) {
                                          global.ice[i]['count'] = 1;
                                        } else {
                                          global.ice[i]['count']--;
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
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (global.ice[i]['bool'] == true) {
                                  global.all_pro.add(global.ice[i]);
                                  global.list_count++;
                                }
                                global.ice[i]['bool'] = false;
                              });
                            },
                            child: Text(
                              "add",
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.purple)),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
