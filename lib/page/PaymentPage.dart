import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter_client/widgets/button/myButton.dart';
import 'package:flutter_client/widgets/other/MyToast.dart' as myToast;
import 'package:flutter_client/widgets/popup/errorAlertDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  double balance = 4700; // Get from server
  double totalBill = 0;
  double bill = 1500; // Get from server
  double tipVal = 0;
  double percentage = 0;
  double tax = 0;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadToast();
    _loadPage();
    _calcResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          new IconButton(
              icon: new Icon(Icons.account_balance_wallet),
              onPressed: () {
                Navigator.pushNamed(context, '/WalletPage');
              }),
        ],
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              _back();
            }),
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Payment',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: globals.whiteBlue,
              child: Column(
                //SingleChildScrollView to solve pixel overflowed error
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //Balance
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: globals.blue,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Balance:",
                          style: TextStyle(fontSize: 14, color: globals.blue_1),
                        ),
                        Text(
                          "\$ " + widget.balance.toStringAsFixed(2),
                          style: TextStyle(fontSize: 32, color: globals.blue_1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey.shade900,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Bill: ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: globals.blue_1),
                                ),
                                Text(
                                  widget.totalBill.toStringAsFixed(2) + "\$",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: globals.blue_1),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "Bill Account: ",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "\$ ${widget.bill.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: globals.blue_1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "Tax 1%",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "\$ ${widget.tax.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: globals.blue_1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "Tip",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  "\$ ${widget.tipVal.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: globals.blue_1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "${widget.percentage.round()} %",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: globals.blue_1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Slider(
                              min: 0,
                              max: 100,
                              divisions: 100,
                              activeColor: globals.blue_1,
                              inactiveColor: Colors.grey,
                              value: widget.percentage,
                              onChanged: _changeTip),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: myButton(
                              width: 100.0,
                              btnText: "Send",
                              onPress: () {
                                if (widget.totalBill > 0) {
                                  _sendBill();
                                  print("Sent");
                                } else {
                                  myToast.showToast(
                                      'Your total bill should be > 0.',
                                      const Icon(Icons.warning));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _changeTip(double prctg) {
    setState(() {
      widget.percentage = prctg;
      widget.tipVal = widget.bill * widget.percentage / 100;
      _calcResult();
    });
  }

  void _calcResult() {
    setState(() {
      widget.totalBill = widget.bill + widget.tipVal + widget.tax;
      widget.tax = widget.totalBill * 1 / 100;
    });
  }

  _sendBill() async {
    try {
      var data = {
        'version': globals.version,
        'account_Id': globals.Id,
        'totalBill': widget.totalBill.toString(),
        'contrat_Id': globals.contrat_Id,
      };
      var res = await CallApi()
          .postData(data, 'Payment/Control/(Control)Payment.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        myToast.showToast('Payment done successfully.', const Icon(Icons.done));
        _back();
      } else if (body[0] == "error4") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error4));
      } else if (body[0] == "error401") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error401));
      } else if (body[0] == "error402") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error402));
      } else if (body[0] == "error403") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error403));
      } else if (body[0] == "errorToken") {
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                message: globals.errorToken,
                goHome: true,
                onPress: () {
                  _clearAll();
                }));
      } else if (body[0] == "errorVersion") {
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.errorVersion,
                  goHome: true,
                  onPress: () {
                    _clearAll();
                  },
                ));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.errorElse));
      }
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }

  _loadToast() {
    globals.fToast = FToast();
    globals.fToast.init(context);
  }

  _loadPage() {
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print("30sec gone!!payment");
      if (mounted) {
        print("30sec gone,and _loadChildrenOnline!!payment");
        _checkBalance();
      }
    });
  }

  _checkBalance() {}

  _clearAll() {
    setState(() {
      globals.clearAll();
    });
  }

  _back() {
    Navigator.pop(context);
  }
}
