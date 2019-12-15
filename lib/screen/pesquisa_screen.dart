import 'package:agroseg/screen/seguro_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroseg/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:agroseg/components/rounded_button.dart';
import 'package:agroseg/components/topo.dart';

class PesquisaScreen extends StatefulWidget {
  static String id = 'pesquisa_screen';

  @override
  _PesquisaScreenState createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topoTela(
        nomePagina:
            'Olá, $nomeCompleto! Vamos te ajudar a encontrar o seguro rural adequado!',
        boolLogo: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//                Slider(value: null, onChanged: null),
            SizedBox(
              height: 5,
            ),
            Text(
              '2) Informações adicionais:',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'UF',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      width: 180.0,
                    ),
                    Text(
                      'Municipio',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      // wrap your Column in Expanded
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
//                      cpf = value;
                        },
                        decoration: kTextFieldStyle.copyWith(
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF8EBC7A), width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Expanded(
                      // wrap your Column in Expanded
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
//                      cpf = value;
                        },
                        decoration: kTextFieldStyle.copyWith(
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF8EBC7A), width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Cultura irrigada?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      'Área (ha) total a ser segurada',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color(0xFF8EBC7A),
                        ),
                      ),
                      onPressed: () {
//                    Navigator.pushNamed(context, PesquisaScreen.id);
                      },
                      child: Text('Sim'),
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color(0xFF8EBC7A),
                        ),
                      ),
                      onPressed: () {
//                    Navigator.pushNamed(context, PesquisaScreen.id);
                      },
                      child: Text('Não'),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
//                      cpf = value;
                        },
                        decoration: kTextFieldStyle.copyWith(
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF8EBC7A), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Data estimada do plantio',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Utiliza sementes ou mudas\ncertificadas/fertilizadas?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
//                      cpf = value;
                        },
                        decoration: kTextFieldStyle.copyWith(
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF8EBC7A), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(width: 10.0,),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color(0xFF8EBC7A),
                        ),
                      ),
                      onPressed: () {
//                    Navigator.pushNamed(context, PesquisaScreen.id);
                      },
                      child: Text('Sim'),
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color(0xFF8EBC7A),
                        ),
                      ),
                      onPressed: () {
//                    Navigator.pushNamed(context, PesquisaScreen.id);
                      },
                      child: Text('Não'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton2(
                      title: 'Calcular',
                      colour: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, SeguroScreen.id);
                      },
                    )

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flag,
              color: Colors.black,
            ),
            title: Text(
              'Inicio',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
            title: Text(
              'Simular',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            title: Text(
              'Histórico',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            title: Text(
              'Minha Conta',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
