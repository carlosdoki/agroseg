import 'dart:ui';

import 'package:agroseg/screen/usuario_screen.dart';
import 'package:flutter/material.dart';

class topoTela extends StatelessWidget with PreferredSizeWidget {
  topoTela({this.nomePagina, this.boolLogo});

  final String nomePagina;
  final bool boolLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
//            constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          decoration: BoxDecoration(
            color: Color(0xFF8EBC7A),
          ),

          child: SafeArea(
            child: Column(children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UsuarioScreen.id,);
                  },
                  child: Icon(
                    Icons.close,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
              boolLogo ? Image.asset('images/logo.png') : SizedBox(height: 0.0,),
              Text(
                nomePagina,
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.0);
}
