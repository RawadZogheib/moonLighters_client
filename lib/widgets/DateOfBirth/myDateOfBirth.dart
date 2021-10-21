

import 'package:flutter/cupertino.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



Color col4 = Colors.blue.shade50;
Color col4_1 = Colors.blue.shade900;
Color col4_2 = Colors.blue.shade900.withOpacity(0.5);



class dateOfBith extends StatefulWidget {
  const dateOfBith({Key? key}) : super(key: key);

  @override
  _dateOfBithState createState() => _dateOfBithState();
}

class _dateOfBithState extends State<dateOfBith> {
  DateTime _date = DateTime.now();
  TextEditingController _datecontroller = new TextEditingController();

  var myFormat = DateFormat('d-MM-yyyy');
  Future<Null?> _selectDate(BuildContext context) async{

    DateTime? _datePicker = await showDatePicker(
      context: context,
      firstDate: DateTime(1947),
      lastDate: DateTime(2022),
      initialDate: _date,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (_datePicker != null && _datePicker != _date){
      setState(() {
        _date = _datePicker;
        print(_date.toString());

        globals.dateOfBirth = myFormat.format(_date);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        controller: _datecontroller,
        cursorColor: col4_1,
        readOnly: true,
        onTap: (){
          setState(() {
            _selectDate(context);
          });
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: col4),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: col4,
          labelText: "Date of birth",
          labelStyle: TextStyle( color: col4_2),
          hintText: ('${myFormat.format(_date)}'),
          hintStyle: TextStyle(
            color: Colors.indigo,
            fontSize: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: col4_1, width: 2.0),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
