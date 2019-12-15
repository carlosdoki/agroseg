import 'package:flutter/material.dart';
import 'package:agroseg/components/rounded_button.dart';
import 'package:agroseg/contants.dart';

class CriarConta_Screen extends StatefulWidget {
  static String id = 'criarconta_screen';

  @override
  _CriarConta_ScreenState createState() => _CriarConta_ScreenState();
}

class _CriarConta_ScreenState extends State<CriarConta_Screen> {
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
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                onChanged: null,
                decoration: kTextFieldStyle.copyWith(
                  hintText: 'CPF ou CNPJ',
                  hintStyle: TextStyle(color: Colors.white,)
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: null,
                  decoration: kTextFieldStyle.copyWith(hintText: 'Senha', hintStyle: TextStyle(color: Colors.white,),),),
              SizedBox(
                height: 15,
              ),
              TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: null,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Confirmar Senha', hintStyle: TextStyle(color: Colors.white,),), ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Checkbox(value: true,),
                  Text(
                    'Aceitar termos de uso',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              RoundedButton(
                title: 'Entrar',
                colour: Color(0xFF8EBC7A),
                onPressed: () {
                  Navigator.pushNamed(context, null);
                },
              ),
            ]))));
  }
}
