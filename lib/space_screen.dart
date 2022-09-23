import 'dart:async';

import 'package:flutter/material.dart';

class home2 extends StatefulWidget {
  const home2({Key? key}) : super(key: key);

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ac5040e23f7c749b384f7ae9596cdf-unscreen.gif",
            height: 400,
          ),
          Image.asset(
            "assets/images/fa6aa8b9f02691e42df56f1678e795-unscreen.gif",
            height: 400,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
