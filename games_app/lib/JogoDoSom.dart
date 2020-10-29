import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class JogoDoSom extends StatefulWidget {
  @override
  _JogoDoSomState createState() => _JogoDoSomState();
}

class _JogoDoSomState extends State<JogoDoSom> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do Som"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Clique nas imagens para emitir os sons",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset("assets/images/dog.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}