import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'SpartanMB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily:'SpartanMB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'SpartanMB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const textfield=InputDecoration(
filled: true,
fillColor: Colors.white,
icon: Icon(Icons.location_city,size: 50.0,),
hintText: 'Enter City Name',
hintStyle: TextStyle(
color: Colors.grey,
),
border: OutlineInputBorder(
borderSide: BorderSide.none,
borderRadius: BorderRadius.all(Radius.circular(10.0),),
)
);