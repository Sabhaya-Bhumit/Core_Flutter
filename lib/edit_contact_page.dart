import 'dart:io';

import 'package:contact_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class edit_contact_apge extends StatefulWidget {
  const edit_contact_apge({Key? key}) : super(key: key);

  @override
  State<edit_contact_apge> createState() => _edit_contact_apgeState();
}

final ImagePicker picker = ImagePicker();
File? imgfile;
final GlobalKey<FormState> contllor = GlobalKey<FormState>();

final TextEditingController fisrtnamecontroller = TextEditingController();
final TextEditingController phonenumbercontroller = TextEditingController();
final TextEditingController lastnamecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();

class _edit_contact_apgeState extends State<edit_contact_apge> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    global.editimage = null;
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    fisrtnamecontroller.text = res.fisrtname;
    lastnamecontroller.text = res.lastname;
    phonenumbercontroller.text = res.phone;
    emailcontroller.text = res.email;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "  Edit",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (contllor.currentState!.validate()) {
                        int i = global.allcontacts.indexOf(res);
                        setState(() {
                          global.allcontacts[i].fisrtname =
                              fisrtnamecontroller.text;
                          global.allcontacts[i].lastname =
                              lastnamecontroller.text;
                          global.allcontacts[i].phone =
                              phonenumbercontroller.text;
                          global.allcontacts[i].email = emailcontroller.text;
                        });
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.done,
                    color: Colors.black,
                  )),
              SizedBox(width: 20),
            ]),
        body: Form(
          key: contllor,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundImage: (res.image != null)
                              ? FileImage(res.image)
                              : null),
                      FloatingActionButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title:
                                        SelectableText("you choise is image"),
                                    actions: [
                                      IconButton(
                                          onPressed: () async {
                                            XFile? image =
                                                await picker.pickImage(
                                                    source: ImageSource.camera);

                                            setState(() {
                                              imgfile = File(image!.path);
                                              global.editimage = imgfile;
                                              int i = global.allcontacts
                                                  .indexOf(res);
                                              global.allcontacts[i].image =
                                                  global.editimage;

                                              Navigator.of(context).pop();
                                            });
                                          },
                                          icon: Icon(Icons.camera)),
                                      SizedBox(width: 40),
                                      IconButton(
                                          onPressed: () async {
                                            XFile? image =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            setState(() {
                                              imgfile = File(image!.path);
                                              global.editimage = imgfile;
                                              int i = global.allcontacts
                                                  .indexOf(res);
                                              global.allcontacts[i].image =
                                                  global.editimage;

                                              Navigator.of(context).pop();
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
                Spacer(),
                Text("Fisrt Name"),
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "You Enter you Fisrt Name";
                      }
                      return null;
                    },
                    controller: fisrtnamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter you Fisrt Name ")),
                SizedBox(height: 20),
                Text("Last Name"),
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "You Enter you Last Name";
                      }
                      return null;
                    },
                    controller: lastnamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter you Last Name ")),
                SizedBox(height: 20),
                Text("Phone Number"),
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "You Enter you Phone Number";
                      }
                      if (val.length < 10) {
                        return "not currect phone number";
                      }
                      return null;
                    },
                    controller: phonenumbercontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter you Phone Number ")),
                SizedBox(height: 20),
                Text("Email"),
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "You Enter you Last Name";
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter you Email ID")),
                Spacer(flex: 4),
              ],
            ),
          ),
        ));
  }
}

// (global.editimage != null)
// ? FileImage(global.editimage!)
// : FileImage(res.image!)
