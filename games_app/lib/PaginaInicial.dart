import 'package:flutter/material.dart';
import 'package:games_app/JogoDaCalculadora.dart';
import 'package:games_app/JogoDoAdivinha.dart';
import 'package:games_app/PaginaSobreJogos.dart';

class PaginaInicial extends StatefulWidget{
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial>{
  void _abrirSobreJogos() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaginaSobreJogos()
        ));
  }
  void _abrirJogoDoAdivinha() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JogoDoAdivinha()
        )
    );
  }
  void _abrirJogoDaCalculadora() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JogoDaCalculadora()
        )
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Para acessar os jogos clique nas imagens",
              style: TextStyle(
                fontSize: 17,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirSobreJogos,
                    child: Image.asset("assets/images/sobre.png",width: 130, height: 130),

                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirJogoDoAdivinha,
                    child: Image.asset("assets/images/adivinha.png",width: 130, height: 130),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirJogoDaCalculadora,
                    child: Image.asset("assets/images/game.png",width: 130, height: 130),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}