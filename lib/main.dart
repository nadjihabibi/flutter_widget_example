import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String fieldText = '', checkBox = '', radioText = '';
  bool mBool = false;
  int radiovalue = 0;
  double sliderText = 0;

  void methodRadio(val) {
    setState(() {
      radiovalue = val;
      //print(radiovalue);
      radioText = radiovalue.toString();
    });
  }

  void methodSlider(sliderValue) {
    setState(() {
      sliderText = sliderValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Contoh Widget di Flutter'),
            backgroundColor: Colors.purpleAccent,
          ),
          body: Column(
            children: <Widget>[
              TextField(
                onChanged: (String txt) {
                  setState(() {
                    fieldText = txt;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Nama lengkap', labelText: 'Nama Anda'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(fieldText),
              Checkbox(
                value: mBool,
                onChanged: (bool cb) {
                  setState(() {
                    mBool = cb;
                    checkBox = mBool.toString();
                  });
                },
              ),
              Text(checkBox),
              Radio(
                value: 1,
                groupValue: radiovalue,
                onChanged: (int change) {
                  methodRadio(change);
                },
              ),
              Radio(
                value: 2,
                groupValue: radiovalue,
                onChanged: (int change) {
                  methodRadio(change);
                },
              ),
              Text(radioText),
              Slider(
                value: sliderText,
                min: 1.0,
                max: 10.0,
                onChanged: (double slideValue) {
                  methodSlider(slideValue);
                },
              ),
              Text('Volume: $sliderText'),
              SizedBox(height: 30.0,),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.purpleAccent)),
            ],
          )),
    );
  }
}
