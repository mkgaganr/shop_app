import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:partner_flutter_app/screens/partner_pending_process.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:provider/provider.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';

class ProcessUpdateScreen extends StatefulWidget {
  static const routeName = '/process-update-screens';
  @override
  _ProcessUpdateScreen createState() => _ProcessUpdateScreen();
}

class _ProcessUpdateScreen extends State<ProcessUpdateScreen> {
  final costController = TextEditingController();
  final completedBoolController = TextEditingController();
  String barcodeScanRes = '';

  Future scanBarcode(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
    setState(() {
      completedBoolController.text = barcodeScanRes;
      this.barcodeScanRes = barcodeScanRes;
      print("barcode text");
      print(this.barcodeScanRes);
    });
  }

  void onAdd() {
    final String val1 = costController.text;
    final String val2 = completedBoolController.text;

    final id = ModalRoute.of(context).settings.arguments;
    print("barcode value is");
    print(val2);
    if (val1.isNotEmpty) {
      Provider.of<ProcessState>(context, listen: false)
          .updateprocessstatus(id, int.parse(val1), val2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final process = Provider.of<ProcessState>(context).singleProcess(id);
    String processid = process.processId;
    String processname = process.processName;

    return Scaffold(
        appBar: AppBar(
          title: Text("Partner Dashboard"),
          actions: [],
        ),
        drawer: AppDrower(),
        body: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 20, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Process ID : $processid",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Process Name : $processname",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    "Status : completed",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 120, top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.top,
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "Part Name:",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Text(
                                      "test",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Dimension:",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "12x12x12mm",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Material:",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Aluminium-6061 T-6",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 1),
                        child: Text(
                          "Comment -",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Read PDF carefully",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "TOTAL COST",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                    "50.000",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "GST(12%)",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                    "3.000",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "TOTAL",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Text(
                                    "\u{20B9} 25.000",
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          controller: costController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          decoration: InputDecoration(
                            labelText: "Enter Cost",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.money),
                              onPressed: () => {},
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          controller: completedBoolController,
                          decoration: InputDecoration(
                            labelText: "Scan Barcode",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.scanner_outlined),
                              onPressed: () {
                                setState(() {
                                  scanBarcode(context);
                                  //completedBoolController.text = barcodeScanRes;
                                });
                              },
                            ),
                          ),
                        ),
                        RaisedButton(
                            child: Text('Completed'),
                            color: Colors.lightBlue,
                            onPressed: () {
                              onAdd();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PendingOrderProcessScreen()));
                            })
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
