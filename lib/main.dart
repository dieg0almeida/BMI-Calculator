import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _imc = "0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cálculo de IMC',
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
          ),
          body: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.calculator),
                    onPressed: () {},
                    iconSize: 64,
                    color: Colors.deepOrange,
                  ),
                  TextField(
                    controller: _weightController,
                    decoration: InputDecoration(labelText: 'Peso (kg)'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _heightController,
                    decoration: InputDecoration(labelText: 'Altura (m)'),
                    keyboardType: TextInputType.number,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "Meu IMC: $_imc",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  FlatButton(
                    child: Text('Calcular'),
                    onPressed: () {
                      if (_heightController.text.isEmpty ||
                          _weightController.text.isEmpty) {
                        setState(() {
                          _imc = "0";
                        });
                      } else {
                        setState(() {
                          _imc = (double.parse(_weightController.text) /
                                  (double.parse(_heightController.text) *
                                      double.parse(_heightController.text)))
                              .toStringAsPrecision(4);
                        });
                      }
                    },
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                  )
                ],
              ))),
    );
  }
}
