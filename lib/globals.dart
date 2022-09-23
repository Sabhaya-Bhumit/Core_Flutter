import 'dart:io';

import 'package:contact_app/contacts.dart';

class global {
  static List<Contact> allcontacts = [
    Contact(
      fisrtname: "bhumit",
      lastname: "sabhaya",
      email: "sabhayabhumit@gmail.com",
      phone: "9054519181",
      image: null,
    )
  ];
  static File? myimage;
  static File? editimage;
  static dynamic sort = "";
}
