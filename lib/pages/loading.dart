
import 'package:flutter/material.dart';
import 'package:test_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


/*

  https://pub.dev/packages/flutter_spinkit

*/

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    worldTime instance = worldTime(location: 'Manila', flag: 'Ph.png', url: 'Asia/Manila');
    await instance.getTime();
    // print(instance.time); -- method used in the root class

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    }); 

  }
  
  @override 
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}