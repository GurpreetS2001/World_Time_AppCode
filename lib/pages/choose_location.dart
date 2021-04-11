import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'Asia/Kolkata',location:'India',flag:'india.jpg'),
    WorldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag:'germany.jpg'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag:'cairo.png'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'america.jpg'),
    WorldTime(url:'America/New_York',location:'New York',flag:'america.jpg'),
    WorldTime(url:'Asia/Seoul',location:'Seoul',flag:'seoul.jpg'),
  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
        },
      )
    );
  }
}
