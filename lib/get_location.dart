
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class Get_location{
  String time="";
  late String offset;
  String location;
  String url;
  String flag;
  bool isDay=false;
  Get_location({required this.url, required this.location, required this.flag});
  
  Future<void> getData() async{
    try{
      Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/${url}"));
      print(response.body);
      offset=jsonDecode(response.body)['utc_offset'];
      DateTime now=DateTime.parse(jsonDecode(response.body)['datetime']);
      time=DateFormat.jm().format(now);
      print("time"+time);
      isDay=now.hour>6 && now.hour<20? true: false;
    }catch(e){
      print("erreur de l'api :" + e.toString());
    }

  }
}