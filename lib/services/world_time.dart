
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {

  String location;
  late String time;
  String flag;
  String url;
  late  bool isDayTime;

  worldTime({required this.location, required this.flag, required this.url});

  Future <void> getTime() async {

    //make request
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')).timeout(Duration(seconds: 5));
      
      Map data = jsonDecode(response.body);
      // print(data);
    
      //get properties
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      // print(dateTime);
      // print(offSet);

      DateTime timeNow = DateTime.parse(dateTime);
      timeNow = timeNow.add(Duration(hours: int.parse(offSet)));
      // print(timeNow); -- raw data

      // formats the data
      isDayTime = timeNow.hour > 6 && timeNow.hour < 20 ? true : false;
      time = DateFormat.jm().format(timeNow); 
      print(time);

    }
    catch (error) {
      print(error);
    }
    

  }
  
}

