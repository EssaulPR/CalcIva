import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperaturas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Sacar iva'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {

  var _output = "inicial";
  final inputController = TextEditingController();
  
  void _iva_cal(){
    setState(() {
      double iva = double.parse(inputController.text);
      double iva_salida = (iva * 0.16);
      double total = (iva_salida + iva);
      _output = "Monto Neto: $total // e iva: $iva_salida";
      // _output = "$iva_salida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //Una barra donde ponemos el titulo
        title: Text(widget.title), //Donde escribimos el titulo
        ),
        body: Center(
          child: Column(  //Body donde ponemos multiples de cosas
            children: [
              TextFormField(
                controller: 
                inputController,
                ),
              RaisedButton(
                onPressed: () {
                  _iva_cal();
                  },),
              Text ("$_output"),
            ],
           ),
        ), 
      );
  }
}