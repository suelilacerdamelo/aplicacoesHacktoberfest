import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class JogoDoAdivinha extends StatefulWidget {
  @override
  _JogoDoAdivinhaState createState() => _JogoDoAdivinhaState();
}

class _JogoDoAdivinhaState extends State<JogoDoAdivinha> {
  static Random gerador = new Random();
  final entrada = TextEditingController();
  var maiorMenor = "";
  int contador = 0;
  int valor = gerador.nextInt(50)+1;
  var _infoText = "Tente adivinhar o número entre 0 e 50";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do Adivinha"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: _resetFields)
        ],
      ),
      body: _body(),
    );
  }

  void _resetFields() {
    setState(() {
      _infoText = "Tente adivinhar o número entre 0 e 50";
      maiorMenor = "";
      valor = gerador.nextInt(50);
      contador = 0;
      entrada.clear();
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
            _textInfo(),
            _editText("Digite o número:", entrada),
            _buttonEnviar(),
            determinarContador(),
          ],
        ),
      ),
    );
  }

  _editText(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => validar(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 19,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: field,
        hintText: "Entre com o número",
        labelStyle: TextStyle(
          fontSize: 19,
          color: Colors.orange,
        ),
      ),
    );
  }

  String validar(String text, String field){
    if(text.isEmpty){
      return "$field";
    }
    return null;
  }

  _buttonEnviar(){
    return Container(
      margin: EdgeInsets.only(top: 60.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.orangeAccent,
        child: Text(
          "Entrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        onPressed: (){
          if(_formKey.currentState.validate()){
            calcular();
          }
        },
      ),
    );
  }

  void calcular(){
    int numero = int.parse(entrada.text);
    contador += 1;
    setState(() {
      if(numero < valor){
        _infoText = valor.toString();
        _infoText = "O número é maior! Tente novamente =(";
        entrada.clear();
      }
      if(numero > valor){
        _infoText = valor.toString();
        _infoText = "O número é menor! Tente novamente =(";
        entrada.clear();
      }
      else if(numero == valor){
        _infoText = valor.toString();
        _infoText = "Ihuuu! Parabéns, você acertou!";
      }
    });
  }

  _textInfo(){
    return Text(
      _infoText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  determinarContador() {
    return Text(
      "Número de tentativas: $contador",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0),

    );
  }

}
