import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice/customer_detail.dart';
import 'package:invoice/global.dart';

class add_customer extends StatefulWidget {
  const add_customer({Key? key}) : super(key: key);

  @override
  State<add_customer> createState() => _add_customerState();
}

final ImagePicker picker = ImagePicker();
File? imgfile;

final GlobalKey<FormState> contlloer = GlobalKey<FormState>();
final TextEditingController shoing_name = TextEditingController();
final TextEditingController fisrt_namecontroller = TextEditingController();
final TextEditingController last_namecontroller = TextEditingController();
final TextEditingController phonecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();

class _add_customerState extends State<add_customer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fisrt_namecontroller.clear();
    last_namecontroller.clear();
    phonecontroller.clear();
    emailcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to detail"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: Container(),
      ),
      body: Scrollbar(
          thickness: 10,
          interactive: true,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) => Form(
                    key: contlloer,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  radius: 70,
                                  backgroundImage: (imgfile != null)
                                      ? FileImage(imgfile!)
                                      : null,
                                ),
                                Positioned(
                                    top: 50,
                                    child: (imgfile == null)
                                        ? Text(
                                            "Add Shoping Logo",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          )
                                        : Text("")),
                                FloatingActionButton(
                                  backgroundColor: Colors.purple,
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: SelectableText(
                                                  "You Choise Is Image"),
                                              actions: [
                                                IconButton(
                                                    onPressed: () async {
                                                      XFile? image =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      global.memoryImage =
                                                          await image!
                                                                  .readAsBytes()
                                                              as Uint8List?;
                                                      setState(() {
                                                        imgfile =
                                                            File(image!.path);
                                                        global.myimage =
                                                            imgfile;

                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                    icon: Icon(Icons.camera)),
                                                SizedBox(width: 40),
                                                IconButton(
                                                    onPressed: () async {
                                                      XFile? image =
                                                          await picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      global.memoryImage =
                                                          await image!
                                                                  .readAsBytes()
                                                              as Uint8List?;
                                                      setState(() {
                                                        imgfile =
                                                            File(image!.path);
                                                        global.myimage =
                                                            imgfile;

                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                    icon: Icon(Icons.album))
                                              ],
                                            ));
                                  },
                                  child: Icon(Icons.add),
                                  mini: true,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Shoping Name"),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter You Shoping Name";
                              }
                              return null;
                            },
                            controller: shoing_name,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 10),
                          Text("Fisrt Name"),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you Fisrt Name";
                              }
                              return null;
                            },
                            controller: fisrt_namecontroller,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 20),
                          Text("Last Name"),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you Fisrt Name";
                              }
                              return null;
                            },
                            controller: last_namecontroller,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 20),
                          Text("Phone "),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you Fisrt Name";
                              }
                              return null;
                            },
                            controller: phonecontroller,
                            keyboardType: TextInputType.phone,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 20),
                          Text("Email"),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter you Fisrt Name";
                              }
                              return null;
                            },
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 50),
                          Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.purple)),
                                    onPressed: () {
                                      setState(() {
                                        if (contlloer.currentState!
                                            .validate()) {
                                          Customer customer = Customer(
                                            fisrt_name:
                                                fisrt_namecontroller.text,
                                            email: emailcontroller.text,
                                            last_name: last_namecontroller.text,
                                            phone: phonecontroller.text,
                                            image: global.myimage,
                                            productss: global.nulls,
                                            shoping_name: shoing_name.text,
                                            pdf_image: global.memoryImage,
                                          );
                                          global.all_pro.clear();
                                          print(
                                              "All product cleat --------------     ${global.all_pro}");
                                          global.list_count = 0;
                                          for (int i = 0;
                                              i < global.fruts.length;
                                              i++) {
                                            global.fruts[i]['count'] = 1;
                                            global.fruts[i]['bool'] = true;
                                          }
                                          ;
                                          for (int i = 0;
                                              i < global.Kitchen.length;
                                              i++) {
                                            global.Kitchen[i]['count'] = 1;
                                            global.Kitchen[i]['bool'] = true;
                                          }
                                          ;
                                          for (int i = 0;
                                              i < global.school.length;
                                              i++) {
                                            global.school[i]['count'] = 1;
                                            global.school[i]['bool'] = true;
                                          }
                                          ;
                                          for (int i = 0;
                                              i < global.ice.length;
                                              i++) {
                                            global.ice[i]['count'] = 1;
                                            global.ice[i]['bool'] = true;
                                          }
                                          ;
                                          global.nullss++;
                                          global.coustomers.add(customer);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Align(
                                                heightFactor: 1,
                                                alignment: Alignment.center,
                                                child:
                                                    Text("You Detail Is Save")),
                                            behavior: SnackBarBehavior.floating,
                                          ));
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                            'add_pro',
                                            (route) => false,
                                          );
                                        }
                                      });
                                    },
                                    child: Text("SAVE")),
                              )),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
