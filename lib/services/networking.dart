import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future<dynamic> getdata()async{
    http.Response response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String data=response.body ;
      return jsonDecode(data);
    }
    else{
      throw Exception('Failed to load data: ${response.statusCode}');
    }

  }
}
