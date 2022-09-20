import 'dart:math';
import 'package:demo/globa.dart';
import 'package:flutter/material.dart';

class trues extends StatefulWidget {
 const trues({Key? key}) : super(key: key);

 @override
 State<trues> createState() => _truesState();
}

class _truesState extends State<trues> {
 @override
 Widget build(BuildContext context) {
   Random random = Random();
   dynamic res = ModalRoute.of(context)!.settings.arguments;
   return Scaffold(
     backgroundColor: Colors.black,
     body: Container(
       alignment: Alignment.center,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             height: 200,
             width: 200,
             child: Image.asset("assets/images/fire-cracker.png"),
           ),
           const SizedBox(height: 10),
           const Text(
             "You Answer is correct",
    style: TextStyle(color: Color(0xff873a47), fontSize: 30),
           ),
           const SizedBox(height: 30),
           Text("You Won \n Rs.${global.totalamount}",
               style:
   const TextStyle(color: Color(0xff8c78640), fontSize: 20)),
           SizedBox(height: 60),
           InkWell(
             borderRadius: BorderRadius.circular(20),
             onTap: () {
               setState(() {
                 global.a = random.nextInt(2000);
                 global.b = random.nextInt(2000);
                 global.c = random.nextInt(2000);
             if (global.count < global.queastions.length - 1) {
                   global.currentqueastion++;
                   global.count++;
                   Navigator.of(context)
             .pushNamedAndRemoveUntil('/', (route) => false);
                 } else {
                   global.count = 0;
                   Navigator.of(context).pushNamed('win');
                 }
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
                   "next",
        style: TextStyle(color: Colors.white, fontSize: 30),
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
//win page//
class win extends StatefulWidget {
 const win({Key? key}) : super(key: key);

 @override
 State<win> createState() => _winState();
}

class _winState extends State<win> {
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
             child: Image.asset("assets/images/fire-cracker.png"),
           ),
           const Text(
             "congratulations",
     style: TextStyle(color: Colors.white, fontSize: 20),
           ),
           SizedBox(height: 30),
           const Text(
             "Game Over",
       style: TextStyle(color: Colors.white, fontSize: 20),
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
                 global.totalamount = 1000;
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
                   "Restart",
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
