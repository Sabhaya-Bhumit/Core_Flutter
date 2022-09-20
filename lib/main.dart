import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double height = 20;
  double weight = 20;
  double age = 10;
  double bmi = 1;

  Color mycolor = const Color(0xff1d1e33);
  Color mymalecolor = const Color(0xff1d1e33);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            //female and male//
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        mycolor = Colors.white30;
                        mymalecolor = const Color(0xff1d1e33);
                      });
                    },
                    child: Ink(
                      color: mycolor,
                      child: Container(
                        height: 190,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Icon(Icons.female_sharp,
                                size: 130, color: Colors.white),
                            const Text(
                              "Famale",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      mycolor = const Color(0xff1d1e33);
                      mymalecolor = Colors.white54;
                    });
                  },
                  child: Ink(
                    color: mymalecolor,
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.male, size: 130, color: Colors.red),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //height//
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    height: 190,
                    color: const Color(0xff1d1e33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${height.toInt()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  )),
                              const TextSpan(
                                  text: "   cm",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ),
                        Slider(
                          min: 0,
                          max: 700,
                          activeColor: const Color(0xfff5c1d1),
                          inactiveColor: const Color(0xff555555),
                          value: height,
                          divisions: 700,
                          onChanged: (val) {
                            setState(() {
                              height = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //weight and age//
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 190,
                    color: const Color(0xff1d1e33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Weight",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weight.toInt()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: const Color(0xff4c4f4e),
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff4c4f5e),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    "-",
                                    style: const TextStyle(
                                      color: Color(0xfffffff),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              // splashColor: Colors.lightBlue,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6e6f7a),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    "+",
                                    style: const TextStyle(
                                      color: Color(0xfff67fa4),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 190,
                    color: const Color(0xff1d1e33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${age.toInt()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        //age//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: const Color(0xff4c4f4e),
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff4c4f5e),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    "-",
                                    style:  TextStyle(
                                      color: Color(0xfffffff),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              // splashColor: Colors.lightBlue,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6e6f7a),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    "+",
                                    style:  TextStyle(
                                      color: Color(0xfff67fa4),
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10,),
            Text(
              "BMI = ${bmi.toInt()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //calculate//
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      bmi = height * height / weight / 10;
                    });
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xffeb1555),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Container(
                      height: 60,
                      width: 320,
                      alignment: Alignment.center,
                      child: const Text(
                        "Calculator",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
