import 'package:contact_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class detai_page extends StatefulWidget {
  const detai_page({Key? key}) : super(key: key);

  @override
  State<detai_page> createState() => _detai_pageState();
}

class _detai_pageState extends State<detai_page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
        title: Text(
          "contacts",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.circle,
                color: Colors.black,
              )),
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 105),
                CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        (res.image != null) ? FileImage(res.image!) : null),
                SizedBox(width: 10),
                IconButton(
                    onPressed: () {
                      setState(() {
                        global.allcontacts.remove(res);

                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      });
                    },
                    icon: Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('edit_contact_page', arguments: res);
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 30),
            Text(
              "                ${res.fisrtname} ${res.lastname}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 70),
            Text(
              "+91 ${res.phone}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 30),
            Divider(
              thickness: 4,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.green,
                  onPressed: () async {
                    Uri uri = Uri.parse("tel:+91${res.phone}");
                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("cannot be posible due to $e"),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: Icon(Icons.phone),
                ),
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.amber,
                  onPressed: () async {
                    Uri uri = Uri.parse("sms:+91${res.phone}");
                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("cannot be posible due to $e"),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: Icon(
                    Icons.message,
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    Uri uri = Uri.parse(
                        "mailto:${res.email}?subject=Heading&body=Test");
                    try {
                      await launchUrl(uri);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("cannot be posible due to $e"),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: Icon(Icons.email),
                ),
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    Share.share(
                        "${res.image}\n${res.fisrtname} ${res.lastname} -${res.phone}\n${res.email}");
                  },
                  child: Icon(Icons.share),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 4,
              color: Colors.black,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
