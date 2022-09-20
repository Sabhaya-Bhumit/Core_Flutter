import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  dynamic ANS = 0;
  double a = 0;
  double b = 0;
  String? op;
  dynamic text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2e2d32),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xff2e2d32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${text}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "${ANS}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2e2d32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 2,
                    width: 360,
                    color: Color(0xff929292),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            calculat('AC');
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xffff5a66),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "AC",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      keypead(numbar: "%", Num: "%", mycolor: Colors.grey),
                      SizedBox(
                        width: 5,
                      ),
                      keypead(
                          Num: "/", mycolor: Color(0XFFFF5A66), numbar: "/"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          keypead(Num: "7", mycolor: Colors.white, numbar: "7"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "4", mycolor: Colors.white, numbar: "4"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "1", mycolor: Colors.white, numbar: "1"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(
                              Num: "00", mycolor: Colors.white, numbar: "00"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          keypead(Num: "8", mycolor: Colors.white, numbar: "8"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "5", mycolor: Colors.white, numbar: "5"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "2", mycolor: Colors.white, numbar: "2"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "0", mycolor: Colors.white, numbar: "0"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          keypead(Num: "9", mycolor: Colors.white, numbar: "9"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "6", mycolor: Colors.white, numbar: "6"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: "3", mycolor: Colors.white, numbar: "3"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(Num: ".", mycolor: Colors.white, numbar: "."),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          keypead(
                              Num: "*",
                              mycolor: Color(0XFFFF5A66),
                              numbar: "*"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(
                              Num: "-",
                              mycolor: Color(0XFFFF5A66),
                              numbar: "-"),
                          SizedBox(
                            height: 20,
                          ),
                          keypead(
                              Num: "+",
                              mycolor: Color(0XFFFF5A66),
                              numbar: "+"),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                calculat('=');
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xffff5a66),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "=",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget keypead({
    required String numbar,
    required String Num,
    required Color mycolor,
  }) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 80,
      color: Color(0xff2e2d32),
      child: InkWell(
        onTap: () {
          setState(() {
            calculat(Num);
          });
        },
        child: Text(
          numbar,
          style: TextStyle(
            fontSize: 30,
            color: mycolor,
          ),
        ),
      ),
    );
  }

  void calculat(
    String btntext,
  ) {
    print(btntext);
    if (btntext == 'AC') {
      print("1");
      op = "0";
      a = 0;
      b = 0;
      ANS = 0;
    } else if (btntext == '/' ||
        btntext == '*' ||
        btntext == '-' ||
        btntext == '+' ||
        btntext == '%') {
      print("2");
      a = double.parse(text!);
      ANS = '';
      op = btntext;
    } else if (btntext == '=') {
      print("3");
      b = double.parse(text!);
      if (op == '+') {
        ANS = (a + b).toString();
      } else if (op == '-') {
        ANS = (a - b).toString();
      } else if (op == '*') {
        ANS = (a * b).toString();
      } else if (op == '/') {
        ANS = (a ~/ b).toString();
      }
    } else {
      print("4");
      ANS = double.parse(btntext).toString();
    }
    setState(() {
      text = ANS;
    });
  }
}
