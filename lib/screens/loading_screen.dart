import 'dart:io';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/city_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LocationScreen(); // test cityscreen
    // }));
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

/*
Stateful widget lifecycle methods:
1. initState - gets triggered when a state is initialised, when a widget is created
 and that object is inserted into the widget tree
2. build - gets triggered when a widget is built and showed up on screen, 
everytime I change a property that the widget depends on, build gets called again..and again as changes happen
3. deactivate - gets triggered when a stateful widget is destroyed

These lifecycles are most useful when you want to perform certain tasks at various stages of a widget's lifecycle.

If we want something to happen the moment that our stateful widget is created, 
we place that task inside initState method
If we want something to happen every single time our stateful widget gets re-built, 
we place that task inside build method
If we want something to happen the moment that our stateful widget is destroyed, 
we place that task inside deactivate method

try catch blocks - 
try {
  //do something that might fail
} catch (e) {
  //catch any exceptions that occur
}
null aware operator - someVariable ?? defaultValue means prefer to use the value of someVariable but if 
it is null at the point, use the substitute (default) value
*/




// import 'package:flutter/material.dart';

// import 'package:geolocator/geolocator.dart';

// import 'package:clima/services/location.dart';

// import 'package:http/http.dart' as http;

// import 'dart:convert' as convert;



// class LoadingScreen extends StatefulWidget {

//   @override

//   _LoadingScreenState createState() => _LoadingScreenState();

// }



// class _LoadingScreenState extends State<LoadingScreen> {

//   @override

//   //gets created the moment the app runs

//   void initState() {

//     super.initState();



//     getLocation();

//   }



//   void getLocation() async {

//     Location location = Location();

//     await location.getCurrentLocation();

//     print(location.latitude);

//     print(location.longitude);

//   }



//   void getData() async {

//     var url = Uri.https(

//       'api.openweathermap.org',

//       '/data/2.5/weather',

//       {

//         'lat': '29',

//         'lon': '129',

//         'appid': '6effee45750ab5d6352883fff30e9166',

//       },

//     );



//     var response = await http.get(url);



//     if (response.statusCode == 200) {

//       var jsonResponse =

//           convert.jsonDecode(response.body) as Map<String, dynamic>;

//       print(jsonResponse);

//     } else {

//       print('Request failed with status: ${response.statusCode}.');

//     }

//   }



//   @override

//   Widget build(BuildContext context) {

//     getData();

//     return Scaffold();

//   }

// }