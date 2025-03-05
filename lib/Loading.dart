
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'get_location.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="laoding";

  void timeData()async {
    Get_location instance=Get_location(url: 'Europe/London',location: 'London', flag: 'london.jpg');
    await instance.getData();
    time=instance.time;
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location' : instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay' : instance.isDay
    });
  }

  @override
  void initState(){
    super.initState();
    timeData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100]
      ),
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 70.0,
      ),
    );
  }
}
