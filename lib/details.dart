import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class Details extends StatefulWidget {
  String flag;
  String name;
  String native;
  String phone;
  String capital;
  String currency;
  List languages;
 Details({Key key,@required this.flag, this.name, this.native, this.phone, this.capital, this.currency, this.languages}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(widget.flag, style: TextStyle(fontSize: 100),),
                    Text(widget.name, style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.center,),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
                 Text("Native: ${widget.native}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                 SizedBox(height: 20,),
                 Text("Phone : ${widget.phone}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                 SizedBox(height: 20,),
                 Text("Capital : ${widget.capital}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                 SizedBox(height: 20,),
                 Text("Currency : ${widget.currency}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text("Language: ${widget.languages}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
               ],
             ),
      ),
    );
  }
}


