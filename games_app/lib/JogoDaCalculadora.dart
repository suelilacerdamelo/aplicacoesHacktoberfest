import 'package:flutter/material.dart';

class JogoDaCalculadora extends StatefulWidget {
  @override
  _JogoDaCalculadoraState createState() => _JogoDaCalculadoraState();
}

class _JogoDaCalculadoraState extends State<JogoDaCalculadora> {
  final _tSoma = TextEditingController();
  final _tSubtracao = TextEditingController();
  final _tMultiplicacao = TextEditingController();
  final _tDivisao = TextEditingController();
  var _infoText = "Informe o valor!";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo das Operações"),
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
    _tSoma.text = "";
    _tSubtracao.text = "";
    _tMultiplicacao.text = "";
    _tDivisao.text = "";
    setState(() {
      _infoText = "Informe o valor!";
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
            _editText("5 + 7 = ", _tSoma),
            _editText("13 - 4 = ", _tSubtracao),
            _editText("7 * 3 = ", _tMultiplicacao),
            _editText("16/4 = ", _tDivisao),
            _buttonCalcular(),
            _textInfo(),
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
        labelStyle: TextStyle(
          fontSize: 19,
          color: Colors.orange,
        ),
      ),
    );
  }

  String validar(String text, String field){
    if(text.isEmpty){
      return "Informe os resultados";
    }
    return null;
  }

  _buttonCalcular() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.orangeAccent,
        child:
        Text(
          "Calcular",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            calcular();
          }
        },
      ),
    );
  }

  void calcular(){
    setState(() {
      int valorSoma = 12;
      int valorSubtracao = 9;
      int valorMultiplicacao = 21;
      int valorDivisao = 4;

      if((int.parse(_tSoma.text) == valorSoma) && (int.parse(_tSubtracao.text) == valorSubtracao) && (int.parse(_tMultiplicacao.text) == valorMultiplicacao) &&  (int.parse(_tDivisao.text) == valorDivisao)){
        _infoText = "Parabéns! Você acertou todos!";
      }
      else if(_tSoma != valorSoma || _tSubtracao != valorSubtracao || _tMultiplicacao != valorMultiplicacao || _tDivisao == valorDivisao){
       _infoText = "Ops! Você errou algum valor. Tente novamente!";
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
}
