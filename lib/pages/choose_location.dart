
import 'package:flutter/material.dart';
import 'package:test_flutter/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  const chooseLocation({super.key});

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {

    List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    worldTime(url: 'Asia/Manila', location: 'Manila', flag: 'Ph.png'),
  ]; 

  void updateTime(index) async {
    worldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0, 
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  
                },
                title: Text (locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}