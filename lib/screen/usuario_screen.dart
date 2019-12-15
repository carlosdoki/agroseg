import 'package:agroseg/components/topo.dart';
import 'package:agroseg/screen/pesquisa_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroseg/contants.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_alert/flutter_alert.dart';

class Cliente {
  final String nome;

  Cliente({this.nome});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      nome: json['Nome'],
    );
  }
}

Future<Cliente> _getData() async {
  final response = await http.get(
    'https://gateway.gr1d.io/production/compline/enriquecimento/v1/data/person/' +
        cpf,
    headers: {
      "X-Api-Key": "4b52af03-0b7f-4bac-890a-cb7dc74ccd3e",
      HttpHeaders.contentTypeHeader: "application/json"
    },
  );
  print(cpf);
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    nomeCompleto = map['Nome'];
    print(map['Nome']);
//    return map;

    return Cliente.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    print(response.statusCode);
    showAlert(context: null, title: "CPF: " + cpf + " não encontrado!", );

    throw Exception('Failed to get');
  }
}

class UsuarioScreen extends StatefulWidget {
  static String id = 'usuario_screen';

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topoTela(
        nomePagina: nomeCompleto == null ? '' : 'Olá, $nomeCompleto! Vamos te ajudar a encontrar o seguro rural adequado!',
        boolLogo: false,
      ),
      body: Container(
        child: FutureBuilder<Cliente>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
//                Slider(value: null, onChanged: null),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1) Escolha a modalidade do seguro:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF8EBC7A),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, PesquisaScreen.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.asset(
                                      'images/tree.png',
                                      scale: 5.0,
                                    ),
                                    Text(
                                      'Seguro agrícola',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF8EBC7A),
                                ),
                              ),
                              onPressed: null,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.asset(
                                      'images/cow.png',
                                      scale: 5.0,
                                    ),
                                    Text(
                                      'Seguro pecuário',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF8EBC7A),
                                ),
                              ),
                              onPressed: null,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.asset(
                                      'images/life-insurance.png',
                                      scale: 5.0,
                                    ),
                                    Text(
                                      'Seguro de vida',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      ' do produtor ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'rural',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF8EBC7A),
                                ),
                              ),
                              onPressed: null,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.asset(
                                      'images/farm.png',
                                      scale: 5.0,
                                    ),
                                    Text(
                                      'Seguro máquinas',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'rurais',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              ;
            } else {
              debugPrint("CircularProgress");
              return new Center(child: new CircularProgressIndicator());
            }
            ;
          },
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
