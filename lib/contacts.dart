import 'dart:io';

class Contact {
  String fisrtname;
  String lastname;
  String phone;
  String email;
  File? image;

  Contact({
    required this.fisrtname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.image,
  });
}
