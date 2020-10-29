import 'package:flutter/material.dart';

class PaginaSobreJogos extends StatefulWidget {
  @override
  _PaginaSobreJogosState createState() => _PaginaSobreJogosState();
}

class _PaginaSobreJogosState extends State<PaginaSobreJogos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre os games"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text("Esse App possui alguns jogos: ",
                style: TextStyle(
                  fontSize: 17,),
              ),
              Text("\n1- Jogo do adivinha o número",
                style: TextStyle(
                  fontSize: 17,),
              ),
              Text("\n2 - Jogo da calculadora",
                style: TextStyle(
                  fontSize: 17,),
              ),
            ],
          )
      ),
    );
  }
}
