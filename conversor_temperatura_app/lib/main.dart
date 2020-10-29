import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // VARIAVEIS
  final _tTemperatura = TextEditingController();
  var _infoText = "Informe qual a temperatura!";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Temperaturas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: _resetFields)
        ],
      ),
      body: _body(),
    );
  }

  // PROCEDIMENTO PARA LIMPAR OS CAMPOS
  void _resetFields(){
    _tTemperatura.text = "";
    setState(() {
      _infoText = "Informe qual a temperatura!";
      _formKey = GlobalKey<FormState>();
    });
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _editText("Temperatura em Cº", _tTemperatura),
              _buttonCalcularFahrenheit(),
              _buttonCalcularKelvin(),
              _buttonCalcularReaumur(),
              _buttonCalcularRankine(),
              _textInfo(),
            ],
          ),
        ));
  }

  // Widget text
  _editText(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 22,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
      ),
    );
  }

  // PROCEDIMENTO PARA VALIDAR OS CAMPOS
  String _validate(String text, String field) {
    if (text.isEmpty) {
      return "Digite $field";
    }
    return null;
  }

  // Widget button
  _buttonCalcularFahrenheit() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child:
        Text(
          "Converter em Fahrenheit",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _calculateFahrenheit();
          }
        },
      ),
    );
  }

  _buttonCalcularKelvin() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child:
        Text(
          "Converter em Kelvin",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _calculateKelvin();
          }
        },
      ),
    );
  }

  _buttonCalcularReaumur() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child:
        Text(
          "Converter em Reaumur",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _calculateReaumur();
          }
        },
      ),
    );
  }

  _buttonCalcularRankine() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child:
        Text(
          "Converter em Rankine",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _calculateRankine();
          }
        },
      ),
    );
  }

  // PROCEDIMENTO PARA CALCULAR O IMC
  void _calculateFahrenheit(){
    setState(() {
      double fahrenheit = double.parse(_tTemperatura.text) * 1.8 + 32;
      String tmpStr = fahrenheit.toStringAsPrecision(4);
      _infoText = tmpStr + " ºF \n";
    });
  }
  void _calculateKelvin(){
    setState(() {
      double kelvin = double.parse(_tTemperatura.text) + 273;
      String tmpStr = kelvin.toStringAsPrecision(4);
      _infoText = tmpStr + " K \n";
    });
  }

  void _calculateReaumur(){
    setState(() {
      double reaumur = double.parse(_tTemperatura.text) * 4/5;
      String tmpStr = reaumur.toStringAsPrecision(3);
      _infoText = tmpStr + " °Ré  \n";
    });
  }

  void _calculateRankine(){
    setState(() {
      double rankine = (double.parse(_tTemperatura.text) + 273.15) * 9/5;
      String tmpStr = rankine.toStringAsPrecision(4);
      _infoText = tmpStr + " Ra \n";
    });
  }

  // // Widget text
  _textInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
    );
  }
}