import 'package:agroseg/screen/nome_screen.dart';
import 'package:agroseg/screen/usuario_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroseg/components/rounded_button.dart';
import 'package:agroseg/contants.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<Cliente> cliente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: Color(0xFF8EBC7A),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Acessar minha conta',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    cpf = value;
                  },
                  decoration: kTextFieldStyle.copyWith(
                    hintText: 'CPF ou CNPJ',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  onChanged: null,
                  decoration: kTextFieldStyle.copyWith(
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              RoundedButton(
                title: 'Entrar',
                colour: Color(0xFF8EBC7A),
                onPressed: () {
                  Navigator.pushNamed(context, UsuarioScreen.id,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
