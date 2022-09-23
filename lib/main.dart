import 'package:contact_app/add_comtact_page.dart';
import 'package:contact_app/detai_page.dart';
import 'package:contact_app/edit_contact_page.dart';
import 'package:contact_app/globals.dart';
import 'package:contact_app/splach_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splach_page',
    routes: {
      'splach_page': (context) => splash_page(),
      '/': (context) => home(),
      'detai_page': (context) => detai_page(),
      'edit_contact_page': (context) => edit_contact_apge(),
      'add_contact_page': (context) => add_contact_page(),
    },
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Exit From App ?"),
                content: Text("Wallcome back"),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop(false);
                        });
                      },
                      child: Text(
                        "no",
                        style: TextStyle(fontSize: 20),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: Text("yes"))
                ],
              )),
      child: Scaffold(
          appBar: AppBar(elevation: 0, title: Text("Contacts"), actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            SizedBox(width: 10),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("fisrtname"),
                  value: "fname",
                ),
                PopupMenuItem(
                  child: Text("Lastname"),
                  value: "lname",
                ),
                PopupMenuItem(
                  child: Text("phome"),
                  value: "phome",
                ),
                PopupMenuItem(
                  child: Text("email"),
                  value: "email",
                ),
                PopupMenuItem(
                  child: Text("regler"),
                  value: "photo",
                ),
              ],
              initialValue: global.sort,
              onSelected: (val) {
                setState(() {
                  global.sort = val;
                  if (global.sort == "lname") {
                    global.allcontacts
                        .sort((a, b) => a.lastname.compareTo(b.lastname));
                  } else if (global.sort == "fname") {
                    global.allcontacts
                        .sort((a, b) => a.fisrtname.compareTo(b.fisrtname));
                  } else if (global.sort == "phone") {
                    global.allcontacts
                        .sort((a, b) => a.phone.compareTo(b.phone));
                  } else if (global.sort == "email") {
                    global.allcontacts
                        .sort((a, b) => a.email.compareTo(b.email));
                  } else {
                    global.allcontacts
                        .sort((a, b) => a.fisrtname.compareTo(b.lastname));
                  }
                  print(global.allcontacts);
                });
              },
            ),
            SizedBox(width: 10),
          ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed('add_contact_page');
                });
              },
              child: Text("+", style: TextStyle(fontSize: 28))),
          body: (global.allcontacts.isEmpty)
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                          child: Icon(Icons.contact_page_outlined), scale: 7),
                      SizedBox(height: 70),
                      Text(
                        "You have no contacts yet",
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: global.allcontacts.length,
                  itemBuilder: (context, i) => ListTile(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('detai_page',
                                arguments: global.allcontacts[i]);
                          });
                        },
                        leading: CircleAvatar(
                            backgroundImage:
                                (global.allcontacts[i].image != null)
                                    ? FileImage(global.allcontacts[i].image!)
                                    : null),
                        title: Text(
                            "${global.allcontacts[i].fisrtname} ${global.allcontacts[i].lastname}"),
                        subtitle: Text("${global.allcontacts[i].phone}"),
                        trailing: IconButton(
                          onPressed: () async {
                            Uri uri = Uri.parse(
                                "tel:+91${global.allcontacts[i].phone}");
                            try {
                              await launchUrl(uri);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("cannot be posible due to $e"),
                                backgroundColor: Colors.redAccent,
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                        ),
                      ))),
    );
  }
}
