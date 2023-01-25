import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? location,
      url,
      flag,
      abbreviation,
      clientIp,
      datetime,
      date,
      time,
      timezone,
      utcOffset;
  int? dayOfWeek, dayOfYear, dstOffset, weekNumber;

  WorldTime({
    this.location,
    this.url,
    this.abbreviation,
    this.clientIp,
    this.datetime,
    this.timezone,
    this.utcOffset,
    this.dayOfWeek,
    this.dayOfYear,
    this.dstOffset,
    this.weekNumber,
  });

  static WorldTime fromJson(Map json) {
    return WorldTime(
      abbreviation: json['abbreviation'],
      clientIp: json['client_ip'],
      datetime: json['datetime'],
      timezone: json['timezone'],
      utcOffset: json['utc_offset'],
      dayOfWeek: json['day_of_week'],
      dayOfYear: json['day_of_year'],
      dstOffset: json['dst_offset'],
      weekNumber: json['week_number'],
    );
  }

  void methodFromJson(Map json) {
    abbreviation = json['abbreviation'];
    clientIp = json['client_ip'];
    datetime = json['datetime'];
    timezone = json['timezone'];
    utcOffset = json['utc_offset'];
    dayOfWeek = json['day_of_week'];
    dayOfYear = json['day_of_year'];
    dstOffset = json['dst_offset'];
    weekNumber = json['week_number'];
  }

  Future<void> getTime() async {
    try {
      // make request on url and store data in the object of Responce
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      //decode the body of respone object and store it in data as Map
      Map data = jsonDecode(response.body);

      //Make object of WorlTime Class
      methodFromJson(data);

      //get DateTime from previous worldTime instance and convert it to date time format
      DateTime dateTime = DateTime.parse(datetime!);
      //get hours from utc_offset
      String hours = utcOffset!.substring(1, 3);
      //get minutes from utc_offset
      String minutes = utcOffset!.substring(4, 6);
      //add the hours and minutes in the DateTime Object
      dateTime = dateTime
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

      //Make the Date more readable by using intl package
      String newtime = DateFormat.jms().format(dateTime);
      time = newtime;
      String currentDate = DateFormat.yMEd().format(dateTime);
      date = currentDate;
    } catch (e) {
      print('error http: $e');
    }
  }
}
