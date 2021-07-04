import 'package:flutter/material.dart';
import 'package:world_time_flutter/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Europe/London','time' ,'London','uk.png', true),
    WorldTime( 'Europe/Berlin', 'time', 'Athens',  'greece.png', true),
    WorldTime( 'Africa/Cairo', 'time', 'Cairo',  'egypt.png', true),
    WorldTime( 'Africa/Nairobi', 'time', 'Nairobi',  'kenya.png', true),
    WorldTime('America/Chicago', 'time', 'Chicago',  'usa.png', true),
    WorldTime('America/New_York', 'time', 'New York',  'usa.png', true),
    WorldTime( 'Asia/Seoul','time',  'Seoul',  'south_korea.png', true),
    WorldTime( 'Asia/Jakarta','time', 'Jakarta',  'indonesia.png', true),
    WorldTime( 'Africa/Algiers','time', 'Algiers',  'algeria.png', true),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });

  }
  @override
  Widget build(BuildContext context) {
    print('Build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].flag),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].url}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
