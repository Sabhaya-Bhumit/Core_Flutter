import 'package:flutter/material.dart';
import 'package:gst_calculater/homephase.dart';

void main(){
 runApp(
   MaterialApp(
   debugShowCheckedModeBanner: false,
     home: home(),
 ),);
}


import 'package:flutter/material.dart';

class home extends StatefulWidget {
 const home({Key? key}) : super(key: key);

 @override
 State<home> createState() => _homeState();
}

class _homeState extends State<home> {
String number="";
 Color mycolor =Colors.white;
 Color gstcolor3 =Colors.grey;
 Color gstcolor5 =Colors.grey;
 Color gstcolor12 =Colors.grey;
 Color gstcolor18 =Colors.grey;
 Color gstcolor28 =Colors.grey;

   double gst3= 0;
   double gst5=0;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text(""),
     backgroundColor: Colors.white,
     ),
    body: Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 360,
                alignment: const Alignment(-0.9,0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children:[
                    Text("   ORIGINAL PRICE"),
                    Spacer(),
                    Text("${number}"),
                  ],


                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width:  360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("GST",
                      style: const TextStyle(
                          fontSize: 18),
                    ),
                  ],
              ),
           ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            setState((){
                              gstcolor3 =Colors.orange;
                              gstcolor18=Colors.grey;
                              gstcolor28=Colors.grey;
                              gstcolor12=Colors.grey;
                              gstcolor5=Colors.grey;

                             gst3=double.parse(number);
                             gst5=double.parse(number);
                             gst3=gst3*(3/100);
                            });
                          },
                          child: Ink(
                            color: gstcolor3,
                           child: Container(
                             height: 30,
                             width: 70,
                             alignment: Alignment.center,
                             child: const Text("3%"),
                           ),
                         ),
                       ),
                        InkWell(
                          onTap: (){
                            setState((){
                              gstcolor5 =Colors.orange;
                              gstcolor3=Colors.grey;
                              gstcolor18=Colors.grey;
                              gstcolor28=Colors.grey;
                              gstcolor12=Colors.grey;

                              gst3=double.parse(number);
                              gst3=gst3*(5/100);
                            });
                          },
                          child: Ink(
                            color: gstcolor5,
                            child: Container(
                              height: 30,
                              width: 70,
                              alignment: Alignment.center,
                              child: const Text("5%"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState((){
                              gstcolor12 =Colors.orange;
                              gstcolor3=Colors.grey;
                              gstcolor5=Colors.grey;
                              gstcolor18=Colors.grey;
                              gstcolor28=Colors.grey;
                              gst3=gst3*(12/100);
                            });
                          },
                          child: Ink(
                            color: gstcolor12,
                            child: Container(
                              height: 30,
                              width: 70,
                              alignment: Alignment.center,
                              child: const Text("12%"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState((){
                              gstcolor18 =Colors.orange;
                              gstcolor3=Colors.grey;
                              gstcolor5=Colors.grey;
                              gstcolor28=Colors.grey;
                              gstcolor12=Colors.grey;
                              gst3=gst3*(18/100);
                            });
                          },
                          child: Ink(
                            color: gstcolor18,
                            child: Container(
                              height: 30,
                              width: 70,
                              alignment: Alignment.center,
                              child: const Text("18%"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState((){
                              gstcolor28 =Colors.orange;
                              gstcolor3=Colors.grey;
                              gstcolor5=Colors.grey;
                              gstcolor12=Colors.grey;
                              gstcolor18=Colors.grey;
                            });
                          },
                          child: Ink(
                            color: gstcolor28,
                            child: Container(
                              height: 30,
                              width: 70,
                              alignment: Alignment.center,
                              child: const Text("28%"),
                            ),
                          ),
                        ),
                      ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            height: 35,
            width: 360,
            alignment: const Alignment(-0.9,0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Text("   FINAL PRICE"),
                const Spacer(),
                 Text(" ${gst3+gst5}.RS   "),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 80,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("\nCGST/SGST"),
                     Text("${gst3/2}"),
                  ],
                ),
              ),
            ],
          ),
           const SizedBox(height: 30,),
           Row(
             children: [
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"7";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("7",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"4";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("4",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"1";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("1",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"00";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("00",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
               const SizedBox(width: 10,),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"8";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("8",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"5";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("5",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"2";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("2",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"0";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("0",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
               const SizedBox(width: 10,),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"9";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("9",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"6";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("6",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        number=number+"3";
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text("3",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor=Colors.white;
                        // number.add();
                      });
                    },
                    child: Ink(
                      color:mycolor,
                      child:Container(
                        height: 100,
                        width:80,
                        alignment: Alignment.center,
                        child: Text(".",style: TextStyle(
                          fontSize: 25,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
               const SizedBox(width: 10,),
               Column(
                children: [
                   InkWell(
                     onTap: (){
                     setState((){
                     mycolor =Colors.white;
                     number="";
                     gst3=0;
                     gst5=0;
                     });
                     },
                     child: Ink(
                       decoration:  BoxDecoration(
                         color: Colors.orange,
                         borderRadius: BorderRadius.circular(100),
                       ),
                     child: Container(
                     height: 210,
                     width: 80,
                    alignment: Alignment.center,
                       child: const Text("AC",style: const TextStyle(
                         fontSize: 30,

                       ),),
                     ),
                  ),
               ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState((){
                        mycolor =Colors.white;
                        number="";
                        gst3=0;
                        gst5=0;
                      });
                    },
                    child: Ink(
                           decoration: BoxDecoration(
                     borderRadius:BorderRadius.circular(100),
                             color:Colors.orange,
                           ),

                      child: Container(
                        height: 210,
                        width: 80,
                        alignment: Alignment.center,
                        child: const Icon(Icons.backspace_outlined,size: 30,),
                      ),
                    ),
                  ),
                ],
              ),
             ],
           ),
        ],
      ),
    ),
   );
 }
}
