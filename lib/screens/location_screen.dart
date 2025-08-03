import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});

  final locationweather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  int ?temperature;
  weathermodel weather=weathermodel();
  String ?weathericon;
  String ?its;
  String ?cityname;
  @override
  void initState(){
    super.initState();
    updateui(widget.locationweather);
  }
  void updateui(dynamic weatherdata){
    print("Weather data received: $weatherdata");
    setState(() {
      if(weatherdata==null){
        temperature=0;
        cityname='';
        weathericon='Error';
            its='Unable to get weather data';
            return;
      }
double temp=weatherdata['main']['temp'];
temperature=temp.toInt();
var condition=weatherdata['weather'][0]['id'];
cityname=weatherdata['name'];
weathericon=weather.getweathericon(condition);
its=weather.getMessage(temperature!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async{
                      var weatherdata= await weather.getlocationweather();
                      updateui(weatherdata);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typedname=await Navigator.push(context, MaterialPageRoute(builder: (context){
                        ;
                        return CityScreen();
                      }));
                      print(typedname);
                      if (typedname != null)
                        {
                         var weatherdata= await weather.getcityweather(typedname);
                        updateui(weatherdata);
                        }
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(children: [Text('$temperature',
                style: kTempTextStyle,), Text(weathericon ?? '' ,
                  style: kConditionTextStyle,)]),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 15.0)),
              Padding(padding: EdgeInsets.only(right: 15.0),
              child: Text('$its! in $cityname',style: kMessageTextStyle,
              textAlign: TextAlign.right,),),
            ],
          ),
        ),
      ),
    );
  }
}
