import 'package:flutter/material.dart';
import 'package:pr3in2/homephase.dart';

void main(){
 runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     home: home(),
   ),
 );
}

import 'dart:math';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
 const home({Key? key}) : super(key: key);

 @override
 State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 Random random= Random();
 int mycolor=100;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
   backgroundColor: Color(0xffffffff),
    body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\nColor Palette",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Generator",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
            SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
               color: Color.fromRGBO(mycolor,600, mycolor, 1),
   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
topRight:Radius.circular(20)),
                  ),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
               color: Color.fromRGBO(800,mycolor, mycolor, 1),
                  ),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
               color: Color.fromRGBO(mycolor,200, mycolor, 1),
                  ),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(600,100, mycolor, 1),
                  ),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(500,200, mycolor, 1),
                  ),
                ),
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                 color: Color.fromRGBO(mycolor, 500, 200, 1),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
             InkWell(
               onTap: (){
                 setState((){
                   mycolor=random.nextInt(1000);
                 });
               },
               child: Ink(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.blue,width: 3),
                 ),
                 child: Container(
                   height: 50,
                   width: 200,
                   alignment: Alignment.center,
                   child: Text("Generate",
                     style: TextStyle(
                       color: Colors.blue,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     ),),
                 ),
               ),
             ),
          ],
        ) ,
      ),
   );
 }
}
