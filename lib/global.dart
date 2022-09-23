import 'dart:io';
import 'dart:typed_data';

import 'package:invoice/customer_detail.dart';

class global {
  static double total_price = 0;
  static double total_count = 0;
  static int list_count = 0;
  static List<List> pro = [];
  static int pdf_page_count = 0;
  static List<Customer> coustomers = [];
  static List pdf_pro = [];
  static List all_pro = [];
  static File? myimage;
  static List all_product = [
    {
      'image': "assets/images/fruits.png",
      'name': "fruits",
    },
    {
      'image': "assets/images/kitchen.png",
      'name': "Kitchen",
    },
    {
      'image': "assets/images/schools.png",
      'name': "school material",
    },
    {
      'image': "assets/images/icecrem.png",
      'name': "Ice Cream",
    },
  ];

  static List fruts = [
    {
      'image': "assets/images/apple.png",
      'name': "apple",
      'count': 1,
      'price': 20,
      'bool': true,
    },
    {
      'image': "assets/images/green_apple.png",
      'name': "green apple",
      'count': 1,
      'price': 30,
      'bool': true,
    },
    {
      'image': "assets/images/mango.png",
      'name': "mango",
      'count': 1,
      'price': 40,
      'bool': true,
    },
    {
      'image': "assets/images/banana.png",
      'name': "banana",
      'count': 1,
      'price': 25,
      'bool': true,
    },
    {
      'image': "assets/images/pineapple.png",
      'name': "pineapple",
      'count': 1,
      'price': 40,
      'bool': true,
    },
    {
      'image': "assets/images/geapes.png",
      'name': "grapes",
      'count': 1,
      'price': 50,
      'bool': true,
    },
    {
      'image': "assets/images/cherry.png",
      'name': "cherry",
      'count': 1,
      'price': 40,
      'bool': true,
    },
    {
      'image': "assets/images/kiwi.png",
      'name': "cherry",
      'count': 1,
      'price': 60,
      'bool': true,
    },
  ];
  static List Kitchen = [
    {
      'image': "assets/images/plate.png",
      'name': "plate",
      'count': 1,
      'price': 35,
      'bool': true,
    },
    {
      'image': "assets/images/bowl.png",
      'name': "bowl",
      'count': 1,
      'price': 15,
      'bool': true,
    },
    {
      'image': "assets/images/jug.png",
      'name': "jug",
      'count': 1,
      'price': 20,
      'bool': true,
    },
    {
      'image': "assets/images/saucerw.png",
      'name': "saucer",
      'count': 1,
      'price': 70,
      'bool': true,
    },
    {
      'image': "assets/images/spoon.png",
      'name': "spoon",
      'count': 1,
      'price': 50,
      'bool': true,
    },
    {
      'image': "assets/images/glass.png",
      'name': "glass",
      'count': 1,
      'price': 60,
      'bool': true,
    }
  ];

  static List school = [
    {
      'image': "assets/images/book.png",
      'name': "book",
      'count': 1,
      'price': 100,
      'bool': true,
    },
    {
      'image': "assets/images/pen.png",
      'name': "pen",
      'count': 1,
      'price': 10,
      'bool': true,
    },
    {
      'image': "assets/images/pencil.png",
      'name': "pencil",
      'count': 1,
      'price': 40,
      'bool': true,
    },
    {
      'image': "assets/images/bag.png",
      'name': "bag",
      'count': 1,
      'price': 50,
      'bool': true,
    },
    {
      'image': "assets/images/calculetar.png",
      'name': "calculator",
      'count': 1,
      'price': 100,
      'bool': true,
    },
  ];
  static List ice = [
    {
      'image': "assets/images/ice1.png",
      'name': "Goladen penal",
      'count': 1,
      'price': 30,
      'bool': true,
    },
    {
      'image': "assets/images/frostic.png",
      'name': "frostic",
      'count': 1,
      'price': 50,
      'bool': true,
    },
    {
      'image': "assets/images/Moroccan.png",
      'name': "Moroccan",
      'count': 1,
      'price': 70,
      'bool': true,
    },
    {
      'image': "assets/images/mango_ice.png",
      'name': "mango ice",
      'count': 1,
      'price': 80,
      'bool': true,
    },
    {
      'image': "assets/images/fruits ice.png",
      'name': "fruits ice",
      'count': 1,
      'price': 120,
      'bool': true,
    },
  ];

  static List nulls = [];
  static int nullss = -1;
  static Uint8List? memoryImage;
}
