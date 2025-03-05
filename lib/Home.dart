import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};


  @override
  Widget build(BuildContext context) {
    data = data.isEmpty?ModalRoute.of(context)?.settings.arguments as Map:data;
    String bgImage= data['isDay']?"assets/morning.jpg":"assets/night.jpg";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
            child: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(60),
                  margin: EdgeInsets.only(bottom: 300,top: 100),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Column(
                    children: [
                     TextButton(
                         onPressed: () async{
                           dynamic result= await Navigator.pushNamed(context, '/choose_location');
                           setState(() {
                             data = {
                               'time' : result['time'],
                               'location' : result['location'],
                               'isDay' : result['isDay'],
                               'flag': result['flag']
                             };
                           });
                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.location_on, color: Colors.white,),
                             Text("choose another location", style: TextStyle(
                               color: Colors.white
                             ),)
                           ],
                         )),
                      SizedBox(height: 20,),
                      Text(data['time'], style: TextStyle(
                        fontSize: 50,
                        color: Colors.white
                      ),),
                      SizedBox(height: 20,),
                      Text(data['location'], style: TextStyle(
                        fontSize: 20, color: Colors.white
                      ),)

                    ],
                  ),
                )
            ),
          ),
      ),
    );
  }
}
