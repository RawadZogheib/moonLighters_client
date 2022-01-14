import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter_client/widgets/button/myButton.dart';
import 'package:flutter_client/widgets/other/plusProjectCard.dart';
import 'package:flutter_client/widgets/popup/errorAlertDialog.dart';
import 'package:flutter_client/widgets/projectCard/accessCard.dart';
import 'package:flutter_client/widgets/projectCard/excelCard.dart';
import 'package:flutter_client/widgets/projectCard/oneNoteCard.dart';
import 'package:flutter_client/widgets/projectCard/powerPointCard.dart';
import 'package:flutter_client/widgets/projectCard/publisherCard.dart';
import 'package:flutter_client/widgets/projectCard/wordCard.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Project extends StatefulWidget {
  final children = <Widget>[];
  final childrenOnline = <Widget>[];

  //double percentage = 95;
  double percentage = 100;

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  Timer? timer;

  /*
  late String contrat_Id;
  late String contrat_name;
  late String contrat_description;
  late String contrat_dollar_per_hour;
  late String contrat_max_payment;
  late String contrat_code;
   */

  List<String> type = [
    "asfasd",
    "Word",
    "Word",
    "Excel",
    "Excel",
    "PowerPoint",
    "PowerPoint",
    "Access",
    "Access",
    "OneNote",
    "OneNote",
    "Publisher",
    "Publisher"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadChildrenOnline();
    _checkVariables();
    _thirtySecAutoLoad();
  }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            new IconButton(
                icon: new Icon(Icons.account_balance_wallet),
                onPressed: () {
                  Navigator.pushNamed(context, '/WalletPage');
                }),
            new IconButton(
                icon: new Icon(Icons.calendar_today),
                onPressed: () {
                  //_back();
                  Navigator.pushNamed(context, '/CalendarPage');
                })
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
              'Project',
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
              child: Container(
                decoration: BoxDecoration(
                  color: globals.whiteBlue,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: globals.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 18.0, 0.0, 14.0),
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 30,
                                  animation: true,
                                  lineHeight: 20.0,
                                  animationDuration: 2000,
                                  percent: (widget.percentage / 100),
                                  center: Text(
                                      (widget.percentage).toString() + "%"),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          widget.percentage == 100
                              ? SizedBox(
                                  height: 14,
                                )
                              : Text(
                                  "Active Projects",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                          widget.percentage == 100
                              ? myButton(
                                  btnText: "Pay",
                                  width: 200.0,
                                  onPress: () {
                                    Navigator.pushNamed(context, '/PaymentPage');
                                  },
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 2.0, 8.0, 11.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: globals.whiteBlue),
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: widget.childrenOnline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Container(
                          color: Colors.white,
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 36,
                                ),
                              ),
                              Center(
                                child: Wrap(
                                  children: widget.children,
                                  //new Card(child: Text('B'))
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createCards(String Id, String saveName, String description, String type) {
    print(type);

    switch (type) {
      case "Microsoft Word":
        {
          return WordCard(saveName: saveName, description: description);
          //break;
        }
      case "Microsoft Excel":
        {
          return ExcelCard(saveName: saveName, description: description);
        }
      case "Microsoft PowerPoint":
        {
          return PowerPointCard(saveName: saveName, description: description);
        }
      case "Microsoft Access":
        {
          return AccessCard(saveName: saveName, description: description);
        }
      case "Microsoft OneNote":
        {
          return OneNoteCard(saveName: saveName, description: description);
        }
      case "Microsoft Publisher":
        {
          return PublisherCard(saveName: saveName, description: description);
        }
      default:
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: "\"$type\" is not a type of file."));
          return Container();
        }
    }
  }

  void _loadPage() async {
    try {
      var data = {
        'version': globals.version,
        'account_Id': globals.Id,
        'contrat_Id': globals.contrat_Id,
      };
      var res = await CallApi()
          .postData(data, 'Project/Control/(Control)loadProject.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        //SharedPreferences localStorage = await SharedPreferences.getInstance();
        //localStorage.setString('token', body[1]);

        widget.children.clear();
        for (var i = 0; i < body[1].length; i++) {
          widget.children.add(_createCards(
            body[1][i][0], //project_Id
            body[1][i][1], //project_name
            body[1][i][2], //project_description
            body[1][i][3], //project_type
          ));
          // print(body[2][i][0]);
          // print(body[2][i][1]);
          // print(body[2][i][2]);
          // print(body[2][i][3]);
        }
        //if (mounted) {
        setState(() {
          widget.children;
        });
        //}
      } else if (body[0] == "error4") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error4));
      } else if (body[0] == "error10") {
        setState(() {
          widget.children.add(PlusProjectCard());
        });
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error10));
      } else if (body[0] == "errorToken") {
        widget.children.clear();

        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                message: globals.errorToken,
                goHome: true,
                onPress: () {
                  _globRegist();
                  _globContrat();
                }));
      } else if (body[0] == "errorVersion") {
        widget.children.clear();
        // print("errorrrrrrVersionnnnnn");
        // print("${globals.Id}");
        // print("${globals.contrat_Id}  ${globals.contrat_code}  ${globals.contrat_description}  ${globals.contrat_description}  ${globals.contrat_dollar_per_hour}  ${globals.contrat_max_payment}  ${globals.contrat_name}");

        // print("${globals.Id}  ${globals.userName}  ${globals.email}  ${globals.dateOfBirth}  ${globals.gender}  ${globals.fName}  ${globals.lName}\n");
        // print("${globals.contrat_Id}  ${globals.contrat_code}  ${globals.contrat_description}  ${globals.contrat_description}  ${globals.contrat_dollar_per_hour}  ${globals.contrat_max_payment}  ${globals.contrat_name}");
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.errorVersion,
                  goHome: true,
                  onPress: () {
                    _globRegist();
                    _globContrat();
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

  _loadChildrenOnline() async {
    try {
      // widget.children.clear();
      // var data = {
      //   'version':globals.version,
      //   'account_Id': globals.Id,
      //   'contrat_Id': globals.contrat_Id,
      // };
      // var res = await CallApi().postData(data, 'Project/Control/(Control)loadProject.php');
      // print(res.body);
      // List<dynamic> body = json.decode(res.body);
      //
      // if (body[0] == "success") {
      //   //SharedPreferences localStorage = await SharedPreferences.getInstance();
      //   //localStorage.setString('token', body[1]);
      //
      //   for (var i = 0; i < body[1].length; i++) {
      //     widget.children.add(_createCards(
      //       body[1][i][0], //project_Id
      //       body[1][i][1], //project_name
      //       body[1][i][2], //project_description
      //       body[1][i][3], //project_type
      //     ));
      //     // print(body[2][i][0]);
      //     // print(body[2][i][1]);
      //     // print(body[2][i][2]);
      //     // print(body[2][i][3]);
      //   }
      //   setState(() {
      //     widget.children;
      //   });

      widget.childrenOnline.clear();

      widget.childrenOnline.addAll([
        _iconContainer("word"),
        _iconContainer("excel"),
        _iconContainer("powerPoint"),
        _iconContainer("access"),
        _iconContainer("oneNote"),
        _iconContainer("publisher"),
        _iconContainer("word"),
        _iconContainer("excel"),
        _iconContainer("powerPoint"),
        _iconContainer("access"),
        _iconContainer("oneNote"),
        _iconContainer("publisher"),
      ]);

      //if (mounted) {
      setState(() {
        widget.childrenOnline;
      });
      //}

      // }else if(body[0] == "error4"){
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) => ErrorAlertDialog(
      //           message: globals.error4));
      // }else if(body[0] == "error10"){
      //   setState(() {
      //     widget.children.add(PlusProjectCard());
      //   });
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) => ErrorAlertDialog(
      //           message: globals.error10));
      // } else if (body[0] == "errorToken") {
      //   widget.children.clear();
      //
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) =>
      //           ErrorAlertDialog(message: globals.errorToken, goHome: true,
      //               onPress: (){
      //                 _globRegist();
      //                 _globContrat();
      //               }));
      // } else if(body[0] == "errorVersion"){
      //   widget.children.clear();
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) =>
      //           ErrorAlertDialog(message: globals.errorVersion, goHome: true,
      //             onPress: (){
      //               _globRegist();
      //               _globContrat();
      //             },));
      // } else {
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) => ErrorAlertDialog(
      //           message: globals.errorElse));
      // }
      // await Future.delayed(const Duration(seconds: 30), () {
      //  print("30sec gone!!");
      //         if (mounted) {
      //           print("30sec gone,and _loadChildrenOnline!!");
      //           _loadChildrenOnline();
      //         }
      // });
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }

  void _checkVariables() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    globals.Id = localStorage.getString('Id');
    globals.contrat_Id = localStorage.getString('contrat_Id');
    globals.contrat_name = localStorage.getString('contrat_name');
    globals.contrat_description = localStorage.getString('contrat_description');
    globals.contrat_dollar_per_hour =
        localStorage.getString('contrat_dollar_per_hour');
    globals.contrat_max_payment = localStorage.getString('contrat_max_payment');
    globals.contrat_code = localStorage.getString('contrat_code');
    //globals.contrat_code = null;
    if (globals.contrat_Id == null ||
        globals.contrat_name == null ||
        globals.contrat_description == null ||
        globals.contrat_dollar_per_hour == null ||
        globals.contrat_max_payment == null ||
        globals.contrat_code == null) {
      print("Error: variable error page /Contrat");
      await Future.delayed(Duration(seconds: 1));
      //await Future.delayed(const Duration(seconds: 2), (){});
      _back();
    } else {
      /*
      contrat_Id = globals.contrat_Id.toString();
      contrat_name = globals.contrat_name.toString();
      contrat_description = globals.contrat_description.toString();
      contrat_dollar_per_hour = globals.contrat_dollar_per_hour.toString();
      contrat_max_payment = globals.contrat_max_payment.toString();
      contrat_code = globals.contrat_code.toString();

      globals.contrat_Id = null;
      globals.contrat_name = null;
      globals.contrat_description = null;
      globals.contrat_dollar_per_hour = null;
      globals.contrat_max_payment = null;
      globals.contrat_code = null;
     */
      _loadPage();
    }
  }

  _iconContainer(String appName) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: appName,
          child: Image(
            height: 40,
            width: 40,
            image: AssetImage(
              'Assets/projectLogo/${appName}Logo.png',
            ),
          ),
        ),
      ),
    );
  }

  _back() {
    timer?.cancel();
    globals.contrat_Id = null;
    globals.contrat_name = null;
    globals.contrat_dollar_per_hour = null;
    globals.contrat_max_payment = null;
    globals.contrat_description = null;
    globals.contrat_code = null;
    widget.children.clear();
    Navigator.of(context).pop();
  }

  _globRegist() {
    setState(() {
      globals.Id = null;
    });
  }

  _globContrat() {
    setState(() {
      globals.clearContrat();
    });
  }

  _thirtySecAutoLoad() {
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone,and _loadChildrenOnline!!");
        if (widget.percentage != 100) {
          _loadChildrenOnline();
        }
        _checkVariables();
      }
    });
  }
}
