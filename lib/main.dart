import 'dart:math';

import 'package:flutter/material.dart';

void main() {
 runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     home: home(),
   ),
 );
}

class home extends StatefulWidget {
 const home({Key? key}) : super(key: key);

 @override
 State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 TextEditingController controller=TextEditingController();

 Random random=Random();

 int count=0;

 List l1 = ["",];
 String l2=" ";



 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xff15172b),
     body: Container(
       padding: EdgeInsets.all(20),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text(
             "OTP Generator",
             style: TextStyle(
               fontSize: 40,
               color: Color(0xfff6db87),
               fontWeight: FontWeight.bold,
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 height: 80,
                 width: 260,
                 child: TextField(
                   controller: controller,
                   autofocus: true,
                   maxLength: 1,
                   onChanged: (val){
                       count=int.parse(val);
                   },
                   style: TextStyle(
                     color: Color(0xfff6db87),
                     fontSize: 25,
                   ),
                   keyboardType: TextInputType.number,
                   cursorColor: Color(0xfff6db87),
                   decoration: InputDecoration(
                     hintText: "Enter OTP Length",
                     hintStyle: TextStyle(
                       color: Colors.grey,
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Color(0xfff6db87),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
           SizedBox(height: 10,),
           InkWell(
             splashColor: Colors.white.withOpacity(1),
             borderRadius: BorderRadius.circular(20),
             onTap: (){
               l1.clear();
               setState((){
                 if(count > 3&& length<9) {
                   for (int i =0 ; i < length; i++) {
                     l1.add(random.nextInt(9).toString());
                   }
                 }
                 else
                 {
                   length = 0;
                   l1.clear();
                   ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:
                   Text(" Enter you Length is 4 to 8"),),);
                 }

                 l2=l1.toString();
               });
             },
             child: Ink(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 gradient: LinearGradient(
                   begin: Alignment(-1,1),
                   end: Alignment(0.1,0),
                   colors: [
                     Colors.white,
                     Color(0xfff6db87),
                   ],
                 ),
               ),
               child: Container(
                 height: 60,
                 width: 250,
                 alignment: Alignment.center,
                 child: Text("Generate OTP",style: TextStyle(
                   fontSize: 25,
                 ),),
               ),
             ),
           ),
           SizedBox(height: 10,),
           Container(
             height: 70,
             width: 320,
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               gradient: LinearGradient(
                 begin: Alignment(-1,1),
                 end: Alignment(0.1,0),
                 colors: [
                   Colors.white,
                   Color(0xfff6db87),
                 ],
               ),
             ),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: l1.map((e) => Text("$e",style: TextStyle(fontSize: 25,)),).toList(),
             ),
           ),
           SizedBox(height: 10,),
           InkWell(
             splashColor: Colors.white.withOpacity(1),
             borderRadius: BorderRadius.circular(20),
             onTap: (){
               setState((){
                controller.clear();
                l2="";
                l1.clear();
               });
             },
             child: Ink(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 gradient:const  LinearGradient(
                   begin: Alignment(-1,1),
                   end: Alignment(0.1,0),
                   colors: [
                     Colors.white,
                     Color(0xfff6db87),
                   ],
                 ),
               ),
               child: Container(
                 height: 60,
                 width: 250,
                 alignment: Alignment.center,
                 child: Text("Reset",style: TextStyle(
                   fontSize: 25,
                 ),),
               ),
             ),
           ),
           SizedBox(height: 10,),
         ],
       ),
     ),
   );
 }
}
