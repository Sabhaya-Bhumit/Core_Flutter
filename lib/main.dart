import 'dart:math';

import 'package:demo/false.dart';
import 'package:flutter/material.dart';
import 'package:demo/true.dart';
import 'package:demo/globa.dart';
import 'package:demo/true.dart';
import 'package:demo/true.dart';

void main() {
 runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
       '/': (context) => home(),
       'true': (context) => trues(),
       'false': (context) => falses(),
       'win': (context) => win(),
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
 Random random = Random();

 Widget button(String number) {
   return Ink(
     decoration: BoxDecoration(
       color: Color(0xff1e1f23),
       borderRadius: BorderRadius.circular(20),
     ),
     child: Container(
       height: 60,
       width: 190,
       alignment: Alignment.center,
       child: Text(
         "$number",
     style: TextStyle(color: Color(0xffa8a8a9), fontSize: 20),
       ),
     ),
   );
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("KBC GAME"),
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.black87,
     ),
     backgroundColor: Color(0xff00000),
     body: Column(
       children: [
         Container(
           child: IndexedStack(
             index: global.currentqueastion,
             children: global.queastions.map((e) {
             
               return Column(
                 children: [
                   Container(
                     height: 350,
                     width: double.infinity,
      color: Color.fromRGBO(global.a, global.b, global.c, 1),
                     alignment: Alignment.center,
                     child: Text(
                       "${e['queastion']}",
                       textAlign: TextAlign.center,
                       style: const TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   SizedBox(height: 120),
                   Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       InkWell(
             borderRadius: BorderRadius.circular(20),
                         onTap: () {
                           setState(() {
                             if (e['answer'] == "(A)") {
                               global.totalamount =
                     global.totalamount + global.totalamount;
 Navigator.of(context).pushNamed('true', arguments: e);}
 else {
                              Navigator.of(context).pushNamed('false');
                             }
                           });
                         },
                         child: button("${e['mcq1']}"),
                       ),
                       InkWell(
                 borderRadius: BorderRadius.circular(20),
                         onTap: () {
                           setState(() {
                             if (e['answer'] == "(B)") {
                               global.totalamount =
                     global.totalamount + global.totalamount;
       Navigator.of(context).pushNamed('true', arguments: e);
                             } else {
                               Navigator.of(context).pushNamed('false');
                             }
                           });
                         },
                         child: button("${e['mcq2']}"),
                       ),
                     ],
                   ),
                   SizedBox(height: 30),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       InkWell(
                         borderRadius: BorderRadius.circular(20),
                         onTap: () {
                           setState(() {
                             if (e['answer'] == "(C)") {
                               global.totalamount =
                   global.totalamount + global.totalamount;
     Navigator.of(context).pushNamed('true', arguments: e);
                             } else {
                               Navigator.of(context).pushNamed('false');
                             }
                           });
                         },
                         child: button(
                           "${e['mcq3']}",
                         ),
                       ),
                       InkWell(
                         borderRadius: BorderRadius.circular(20),
                         onTap: () {
                           setState(() {
                             if (e['answer'] == "(D)") {
                               global.totalamount =
                      global.totalamount + global.totalamount;
      Navigator.of(context).pushNamed('true', arguments: e);
                             } else {
                               Navigator.of(context).pushNamed('false');
                             }
                           });
                         },
                         child: button("${e['mcq4']}"),
                       ),
                     ],
                   ),
                   Text("${global.answer}")
                 ],
               );
             }).toList(),
           ),
         )
       ],
     ),
   );
 }}
