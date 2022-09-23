import 'dart:io';
import 'dart:typed_data';

class Customer {
  final String? shoping_name;
  final dynamic? fisrt_name;
  final File? image;
  final dynamic? last_name;
  final dynamic? phone;
  final dynamic? email;
  final Uint8List? pdf_image;
  List? productss;
  int? totals;
  int? count;

  Customer({
    this.phone,
    this.email,
    this.fisrt_name,
    this.last_name,
    this.productss,
    this.image,
    this.totals,
    this.count,
    this.pdf_image,
    this.shoping_name,
  });
}
