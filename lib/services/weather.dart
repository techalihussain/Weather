
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:permission_handler/permission_handler.dart';
const apikey='959412973f31528e447a0d2a25842b73';
const openweathermap='https://api.openweathermap.org/data/2.5/weather';
class weathermodel{
  Future<dynamic> getcityweather(String cityname)async{
 NetworkHelper networkHelper=await NetworkHelper('$openweathermap?q=$cityname&appid=$apikey&units=metric');
  var weatherdata= await networkHelper.getdata();
  return weatherdata;
  }
  Future<dynamic> getlocationweather()async{
    try {
      Location location = Location();
      await location.getcurrentlocation();
      NetworkHelper networkHelper = NetworkHelper(
          '$openweathermap?lat=${location
              .latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
      var weatherdata = await networkHelper.getdata();
      return weatherdata;
    }
    catch(e){
      throw Exception('Failed to fetch weather: $e');
    }
  }
  String getweathericon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
