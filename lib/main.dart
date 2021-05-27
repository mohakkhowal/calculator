//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  pressbutton(String x) {
    if (x == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (x == "+" || x == "-" || x == "/" || x == "*") {
      num1 = double.parse(output);

      operand = x;

      _output = "0";
    } else if (x == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + x;
      }
    } else if (x == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + x;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  RawMaterialButton button(var x) {
    return RawMaterialButton(
      padding: EdgeInsets.all(20),
      onPressed: () {
        pressbutton(x);
      },
      elevation: 5,
      child: Text(
        '$x',
        style: TextStyle(color: Colors.white),
        textScaleFactor: 1.5,
      ),
      fillColor: Colors.black87,
      splashColor: Colors.white,
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          leading: Icon(FlutterIcons.calculator_sli),
          backgroundColor: Colors.black,
          title: Text('Calculator'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white70, Colors.black54]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "$num1 $operand",
                    textAlign: TextAlign.right,
                    textScaleFactor: 3,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "$output",
                    textAlign: TextAlign.right,
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.transparent,
                  child: Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              button("7"),
                              button("4"),
                              button("1"),
                              RawMaterialButton(
                                padding: EdgeInsets.all(20),
                                onPressed: () {
                                  pressbutton("AC");
                                },
                                elevation: 5,
                                child: Text(
                                  "AC",
                                  style: TextStyle(color: Colors.white),
                                  textScaleFactor: 1.5,
                                ),
                                fillColor: Colors.black87,
                                splashColor: Colors.white,
                                shape: CircleBorder(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              button("8"),
                              button("5"),
                              button("2"),
                              button("0"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              button("9"),
                              button("6"),
                              button("3"),
                              button("."),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              button("+"),
                              button("-"),
                              button("*"),
                              button("/"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Expanded(
                    child: RaisedButton(
                      elevation: 10,
                      splashColor: Colors.white,
                      onPressed: () {
                        pressbutton("=");
                      },
                      child: Text(
                        '=',
                        textScaleFactor: 2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
