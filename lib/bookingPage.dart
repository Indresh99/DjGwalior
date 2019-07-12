import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class Booking extends StatefulWidget {

  String aplha;
  String name;
  String window_name;

  Booking({Key key, @required this.aplha, this.name, this.window_name}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  DateTime picked;
  String ap_bar;
  Color _color = Colors.grey;
  DateTime _date = DateTime.now();
  _selectDate(BuildContext context) async{
    picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2028));


    if(picked!=null && picked !=DateTime.now()){
      setState(() {
        _date = picked;
        _color = Colors.red[500];
      });
    }

    }

  TextEditingController _editingController_name = TextEditingController();
  TextEditingController _editingController_email = TextEditingController();
  TextEditingController _editingController_mobile = TextEditingController();
  TextEditingController _editingController_password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
            title: Text(widget.window_name),
          ),
          body: Builder(
            builder: (context) =>
                Material(
                  child: Form(
                    key: _formKey,
                    child: Material(
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    controller: _editingController_name,
                                    decoration: InputDecoration(
                                      hintText: "Full Name",
                                      border: OutlineInputBorder(
                                        gapPadding: 10,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
//                      suffixIcon: Icon(Icons.person_pin)
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Some text';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    controller: _editingController_email,
                                    decoration: InputDecoration(
                                      hintText: "Email(optional)",
                                      border: OutlineInputBorder(
                                        gapPadding: 10,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
//                      suffixIcon: Icon(Icons.person_pin)
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Some text';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    controller: _editingController_mobile,
                                    decoration: InputDecoration(
                                      hintText: "Mobile",
                                      border: OutlineInputBorder(
                                        gapPadding: 10,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
//                      suffixIcon: Icon(Icons.person_pin)
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Some text';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(

                                    controller: _editingController_password,
                                    decoration: InputDecoration(
                                      hintText: "Address",
                                      border: OutlineInputBorder(
                                        gapPadding: 10,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
//                      suffixIcon: Icon(Icons.person_pin)
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Some text';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text("Booking date: "+DateFormat('dd-MMMM-yyyy').format(_date), style: TextStyle(
                                      color: _color,
                                    ),),
                                    trailing: Icon(Icons.date_range,),
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text(
                                                "Processing...")));
                                      }
                                      String username = _editingController_name
                                          .text;
                                      String email = _editingController_email
                                          .text;
                                      String mobile = _editingController_mobile
                                          .text;
                                      String password = _editingController_password
                                          .text;
                                      _upload(
                                          username, email, mobile, password, DateFormat('dd-MMMM-yyyy').format(_date));
                                      //Scaffold.of(context).showSnackBar(SnackBar(content: Text(_editingController.text)));
                                    },
                                    child: Text("Submit"),),
                                )
                              ],
                            ),
                          ],),
                      ),
                    ),

                  ),
                ),
          )
      );
    }

    void _upload(String username, String email, String mobile,
        String address, String date) {

      final DocumentReference _documentReference = Firestore.instance.document("mydata/"+widget.name.toString()+"/Booking/"+widget
      .aplha.toString());

      Map<String, String> data = <String, String>{
        "name": username,
        "email": email,
        "mobile": mobile,
        "Address": address,
        "date of Booking": date,
        "category":  widget.window_name
      };

      _documentReference.setData(data).whenComplete(() {
        print("added");
      }).catchError((e) {
        print(e);
      });
    }
  }



