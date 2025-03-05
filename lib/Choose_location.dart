import 'package:flutter/material.dart';
import 'package:world_time/get_location.dart';


class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  List contries=[
    Get_location(url: 'Europe/London', location: 'London', flag: 'london.png'),
    Get_location(url: 'Europe/Berlin', location: 'Berlin', flag: 'berline.png'),
    Get_location(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.jpg'),
    Get_location(url: 'Africa/Nairobin', location: 'Nairobin', flag: 'Nairobin.jpg'),
    Get_location(url: 'America/Chicago', location: 'Chicago', flag: 'Chicago.gif'),
    Get_location(url: 'America/New_York', location: 'New_York', flag: 'new york.jpg'),
    Get_location(url: 'Asia/Seoul', location: 'Seoul', flag: 'Seoul.jpg'),
    Get_location(url: 'Assia/Jakarta', location: 'Jakarta', flag: 'Jakarta.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose contry"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 8,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 20,0, 20),
            child: ListTile(
              onTap: ()async {
                await contries[index].getData();
                Navigator.pop(context, {
                  'time': contries[index].time,
                  'location' : contries[index].location,
                  'flag': contries[index].flag,
                  'isDay' : contries[index].isDay
                });
                print("time"+contries[index].time);
              },
              title: Text(contries[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${contries[index].flag}"),
                radius: 30,
              ),
            ),
          );
          }),


    );
  }
}
