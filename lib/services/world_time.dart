import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; //url to asset flag
  String url; //location url
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    http.Response response= await http.get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
    Map data= jsonDecode(response.body);

    String datetime= data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now= DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));

    isDayTime= now.hour>8 && now.hour<20 ? true:false;
    time=DateFormat.jm().format(now);
  }
}