import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget{
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela>{
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
  //Variaveis
  final tValorTotal = TextEditingController();
  final tValorBebidas = TextEditingController();
  final tValorGarcon = TextEditingController();
  final tQuantidadePessoas = TextEditingController();
  final tQuantidadePessoasAlcool = TextEditingController();
  final tValorIndividualSemAlcool = TextEditingController();
  final tValorIndividualComAlcool = TextEditingController();
  var _infoText = "Informe os valores!";
  var _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Racha Conta"),
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
  void _resetFields() {
    tValorTotal.text = "";
    tValorBebidas.text = "";
    tValorGarcon.text = "";
    tQuantidadePessoas.text = "";
    tQuantidadePessoasAlcool.text = "";
    tValorIndividualSemAlcool.text = "";
    tValorIndividualComAlcool.text = "";

    setState(() {
      _formKey = GlobalKey<FormState>();
      _infoText = "Informe os valores!";
    });
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(0.1),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _editText("Informe o valor total em reias", tValorTotal),
            _editText("Valor total das bebidas: ", tValorBebidas),
            _editText("Porcentagem do garçom: ", tValorGarcon),
            _editText("Quantidade de pessoas: ", tQuantidadePessoas),
            _editText("Quantas pessoas beberam: ", tQuantidadePessoasAlcool),
            buttonCalcularValorFinal(),
            _textInfo(),
          ],
        ),
      ),
    );
  }

  _editText(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 19,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 20,
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

  buttonCalcularValorFinal() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.orangeAccent,
        child:
        Text(
          "CALCULAR TOTAL A PAGAR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            calcularValorTotal();
          }
        },
      ),
    );
  }

  void calcularValorTotal(){
    setState(() {
        double valor = double.parse(tValorTotal.text);
        String tmpValor = valor.toStringAsPrecision(5);

        double porcentagemGarcom = (double.parse(tmpValor) * int.parse(tValorGarcon.text) / 100);
        String tmpPorcentagemGarcom = porcentagemGarcom.toStringAsPrecision(4);

        double valorTotal = double.parse(tmpValor) + double.parse(tmpPorcentagemGarcom);
        String tmpValorTotal = valorTotal.toStringAsPrecision(5);

        double valorBebida = double.parse(tValorBebidas.text);
        String tmpValorBebidas = valorBebida.toStringAsPrecision(5);

        double totalIndividual = (valorTotal - double.parse(tmpValorBebidas)) / int.parse(tQuantidadePessoas.text);
        String tmpTotalIndividual = totalIndividual.toStringAsPrecision(4);

        double totalIndividualBebeu = totalIndividual + (double.parse(tmpValorBebidas) / int.parse(tQuantidadePessoasAlcool.text));
        String tmpTotalindividualBebeu = totalIndividualBebeu.toStringAsPrecision(4);

        _infoText = "Valor garçom: R\$" + tmpPorcentagemGarcom +
                    "\nValor total: R\$" + tmpValorTotal +
                    "\nValor individual quem não bebeu: R\$" + tmpTotalIndividual +
                    "\nValor individual quem bebeu: R\$" + tmpTotalindividualBebeu;
    });
  }

  _textInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }


}









