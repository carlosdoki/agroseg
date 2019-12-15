import 'package:agroseg/screen/criarconta_screen.dart';
import 'package:agroseg/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:agroseg/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8EBC7A),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/logo.png'),
            SizedBox(
              height: 30,
            ),
            TypewriterAnimatedTextKit(
              text: ['Qual seguro agro você busca hoje?'],
              textStyle: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'ENTRAR',
              colour: Color(0xFF8EBC7A),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'CADASTRAR',
              colour: Color(0xFF8EBC7A),
              onPressed: () {
                Navigator.pushNamed(context, CriarConta_Screen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
