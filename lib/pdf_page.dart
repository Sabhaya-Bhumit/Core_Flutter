import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice/global.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class pdf_page extends StatefulWidget {
  const pdf_page({Key? key}) : super(key: key);

  @override
  State<pdf_page> createState() => _pdf_pageState();
}

class _pdf_pageState extends State<pdf_page> {
  final pdf = pw.Document();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildandsavepdf();
  }

  buildandsavepdf() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                children: [
                  (global.coustomers[global.pdf_page_count].pdf_image != null)
                      ? pw.Container(
                          height: 100,
                          width: 100,
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(
                                  image: pw.MemoryImage(global
                                      .coustomers[global.pdf_page_count]
                                      .pdf_image as Uint8List))),
                        )
                      : pw.Container(),
                  pw.Text(
                      "Shoping Name :${global.coustomers[global.pdf_page_count].shoping_name}"),
                ],
              ),
              pw.Divider(thickness: 5),
              pw.SizedBox(height: 10),
              pw.Text(
                "Customer name:${global.coustomers[global.pdf_page_count].fisrt_name} ${global.coustomers[global.pdf_page_count].last_name}",
                style: pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Customer phone:${global.coustomers[global.pdf_page_count].phone}",
                style: pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Customer email:${global.coustomers[global.pdf_page_count].email}",
                style: pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 5),
              pw.Divider(thickness: 5),
              pw.SizedBox(height: 5),
              pw.Align(
                child: pw.Text("You Product Details",
                    style: pw.TextStyle(fontSize: 20)),
              ),
              pw.Divider(thickness: 5),
              pw.SizedBox(height: 5),
              pw.Row(
                children: [
                  pw.Expanded(child: pw.Text("          Product Name")),
                  pw.Expanded(child: pw.Text("    Product Quantities")),
                  pw.Expanded(child: pw.Text("           Product price"))
                ],
              ),
              pw.Divider(thickness: 5),
              pw.SizedBox(height: 5),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      children: global.pro[global.pdf_page_count]
                          .map((e) => pw.Column(
                                children: [
                                  pw.Text("${e['name']}   "),
                                ],
                              ))
                          .toList(),
                      //
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      children:
                          global.coustomers[global.pdf_page_count].productss!
                              .map((e) => pw.Column(
                                    children: [
                                      pw.Text("${e['count']}   "),
                                    ],
                                  ))
                              .toList(),
                      //
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      children:
                          global.coustomers[global.pdf_page_count].productss!
                              .map((e) => pw.Column(
                                    children: [
                                      pw.Text(
                                          "${e['count']}*${e['price']}=${e['count'] * e['price']}   "),
                                    ],
                                  ))
                              .toList(),
                      //
                    ),
                  ),
                ],
              ),
              pw.Divider(thickness: 5),
              pw.Row(
                children: [
                  pw.Expanded(
                      child: pw.Text(
                          "       Total count is ${global.coustomers[global.pdf_page_count].count}")),
                  pw.Expanded(
                    child: pw.Container(width: 10),
                  ),
                  pw.Expanded(
                      child: pw.Text(
                          "                   Total Price ${global.coustomers[global.pdf_page_count].totals}")),
                ],
              ),
              pw.Divider(thickness: 5),
            ],
          ),
        ),
      ),
    );
    Directory dir = await getTemporaryDirectory();

    File file =
        File("${dir.path}/resume${DateTime.now().microsecondsSinceEpoch}.pdf");
    print(file.path);
    file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    print(res);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text("Pdf"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await Printing.layoutPdf(onLayout: (format) => pdf.save());
                } catch (e) {}
              },
              icon: Icon(Icons.print))
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) => Scrollbar(
                thickness: 10,
                trackVisibility: true,
                interactive: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 70,
                            backgroundImage:
                                (global.coustomers[res].image != null)
                                    ? FileImage(global.coustomers[res].image!)
                                    : null,
                          ),
                        ),
                        Text("${global.coustomers[res].shoping_name}")
                      ],
                    ),
                    Divider(thickness: 5, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      "  coustomer Name: ${global.coustomers[res].fisrt_name} ${global.coustomers[res].last_name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "  phone:${global.coustomers[res].phone}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "  email:${global.coustomers[res].email}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Divider(thickness: 5, color: Colors.black),
                    SizedBox(height: 5),
                    Align(
                      child: Text("You Product Details",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(child: Text("      Product Name")),
                        Expanded(child: Text("Product Quantities")),
                        Expanded(child: Text("       Product price"))
                      ],
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: global.coustomers[res].productss!
                                .map((e) => Column(
                                      children: [
                                        Text("${e['name']}"),
                                      ],
                                    ))
                                .toList(),
                            //
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: global.coustomers[res].productss!
                                .map((e) => Column(
                                      children: [
                                        Text("${e['count']}"),
                                      ],
                                    ))
                                .toList(),
                            //
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: global.coustomers[res].productss!
                                .map((e) => Column(
                                      children: [
                                        Text(
                                            "${e['count']}*${e['price']}=${e['count'] * e['price']}"),
                                      ],
                                    ))
                                .toList(),
                            //
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                                "    Total count is ${global.coustomers[res].count}")),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Transform.rotate(
                                angle: 156 / 100,
                                child: Divider(
                                  indent: 30,
                                  endIndent: 50,
                                  thickness: 5,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Text(
                                "Total Price ${global.coustomers[res].totals}")),
                      ],
                    ),
                    Divider(thickness: 5, color: Colors.black),
                  ],
                ),
              )),
    );
  }
}
