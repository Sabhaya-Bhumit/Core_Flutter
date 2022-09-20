import 'dart:math';

import 'package:flutter/material.dart';
import 'package:demo/globa.dart';
class falses extends StatefulWidget {
 const falses({Key? key}) : super(key: key);

 @override
 State<falses> createState() => _falsesState();
}

class _falsesState extends State<falses> {
 Random random = Random();
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black87,
     body: Container(
       alignment: Alignment.center,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             height: 200,
             width: 200,
             child: Image.asset("assets/images/lose.png"),
           ),
           const Text(
             "oops!",
             style: TextStyle(fontSize: 25, color: Colors.white),
           ),
           const SizedBox(height: 30),
           const Text(
             "Soory You are \n  the lose the",
             style: TextStyle(
               color: Colors.white,
               fontSize: 25,
             ),
           ),
           SizedBox(height: 30),
           InkWell(
             borderRadius: BorderRadius.circular(20),
             onTap: () {
               setState(() {
                 global.a = random.nextInt(2000);
                 global.b = random.nextInt(2000);
                 global.c = random.nextInt(2000);
                 global.currentqueastion = 0;
                 Navigator.of(context)
             .pushNamedAndRemoveUntil('/', (route) => false);
               });
             },
             child: Ink(
               decoration: BoxDecoration(
                 color: Color(0xff1e1f23),
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Container(
                 height: 50,
                 width: 200,
                 alignment: Alignment.center,
                 child: const Text(
                   "Try again",
          style: TextStyle(color: Colors.white, fontSize: 25),
                 ),
               ),
             ),
           ),
         ],
       ),
     ),
   );
 }
}
