import 'package:flutter/material.dart';
import 'package:games_app/PaginaInicial.dart';

class PaginaLogin extends StatefulWidget{
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin>{
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Form( //Armazena o estado dos campos de tempos e faz a validação
        key: _formKey, //Estado do formulário
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 52),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset("assets/images/jogos.png"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Login *',
                hintText: "Digite o login",
              ),
              controller: _controllerLogin,
              validator: (String text){
                if(text.isEmpty){
                  return "Informe o login!";
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Senha *',
                hintText: "Digite a senha"
              ),
              obscureText: true,
              controller: _controllerSenha,
              validator: (String text){
                if(text.isEmpty){
                  return "Informe a senha!";
                }
                if(text.length < 4){
                  return "Senha inválida! Informe pelo menos 4 dígitos";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            Container(
              height: 46,
              child: RaisedButton(
                color: Colors.deepOrangeAccent,
                child: Text("Entrar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                onPressed: (){
                  bool formOK = _formKey.currentState.validate();
                  if(! formOK){
                    return;
                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaInicial()
                      ),
                    );
                  }
                  print("Login " + _controllerLogin.text);
                  print("Senha " + _controllerSenha.text);
                },
              ),
            ),
          ],
        ), 
      ),
    );
  }
}