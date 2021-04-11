import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.jpg':'night.jpeg';
    Color bgColor= data['isDayTime'] ? Colors.lightBlueAccent: Colors.black12;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result=await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data={
                            'location' : result['location'],
                            'flag' : result['flag'],
                            'time' : result['time'],
                            'isDayTime' : result['isDayTime'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[200],
                      ),
                      label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: Colors.pink
                          ),
                      ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                          color: Colors.amberAccent,
                        )
                      ),
                    ]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70.0,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            ),
          )

      ),
    );
  }
}
