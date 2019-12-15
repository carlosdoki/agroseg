import 'package:agroseg/screen/criarconta_screen.dart';
import 'package:agroseg/screen/inicio_screen.dart';
import 'package:agroseg/screen/login_screen.dart';
import 'package:agroseg/screen/nome_screen.dart';
import 'package:agroseg/screen/pesquisa_screen.dart';
import 'package:agroseg/screen/seguro_screen.dart';
import 'package:agroseg/screen/usuario_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroseg/screen/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CriarConta_Screen.id: (context) => CriarConta_Screen(),
        LoginScreen.id: (context) => LoginScreen(),
        UsuarioScreen.id: (context) => UsuarioScreen(),
        PesquisaScreen.id: (context) => PesquisaScreen(),
        SeguroScreen.id: (context) => SeguroScreen(),
        InicioScreen.id: (context) => InicioScreen(),
        NomeScreen.id: (context) => NomeScreen()
      },
    );
  }
}