import 'dart:io';

import 'package:contact_app/contacts.dart';
import 'package:contact_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class add_contact_page extends StatefulWidget {
  const add_contact_page({Key? key}) : super(key: key);

  @override
  State<add_contact_page> createState() => _add_contact_pageState();
}

final ImagePicker picker = ImagePicker();
File? imgfile;

final GlobalKey<FormState> contllor = GlobalKey<FormState>();

final TextEditingController fisrtnamecontroller = TextEditingController();
final TextEditingController phonenumbercontroller = TextEditingController();
final TextEditingController lastnamecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();

class _add_contact_pageState extends State<add_contact_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fisrtnamecontroller.clear();
    phonenumbercontroller.clear();
    lastnamecontroller.clear();
    emailcontroller.clear();
    imgfile = null;
    global.myimage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "  Add",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (contllor.currentState!.validate()) {
                        Contact contact = Contact(
                          fisrtname: fisrtnamecontroller.text,
                          lastname: lastnamecontroller.text,
                          email: emailcontroller.text,
                          phone: phonenumbercontroller.text,
                          image: global.myimage,
                        );
                        setState(() {
                          global.allcontacts.add(contact);
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
                        backgroundImage:
                            (imgfile != null) ? FileImage(imgfile!) : null,
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            imgfile = File(image!.path);
                            global.myimage = imgfile;
                          });
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
                Spacer(flex: 4)
              ],
            ),
          ),
        ));
  }
}
