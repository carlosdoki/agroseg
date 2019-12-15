import 'package:agroseg/screen/inicio_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroseg/components/topo.dart';
import 'package:agroseg/components/rounded_button.dart';

class SeguroScreen extends StatefulWidget {
  static String id = 'seguro_screen';

  @override
  _SeguroScreenState createState() => _SeguroScreenState();
}

class _SeguroScreenState extends State<SeguroScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: topoTela(
        nomePagina: 'Pronto!\nSelecione uma opção para avançar.',
        boolLogo: false,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20.0,),
                      Text('Agrícola Avançado', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700,),),
//                      Text('Em análise'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xFF8EBC7A),
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/umbrella.png', scale: 11.0,),
                            SizedBox(width: 30.0,),
                            Image.asset('images/rain.png', scale: 11.0,),
                            SizedBox(width: 30.0,),
                            Image.asset('images/fire.png', scale:11.0,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('Mais informações'),
                            SizedBox(
                              width: 20,
                            ),
                            FlatButton(onPressed: null, child: null)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 150,
                        child: Divider(),
                      ),
                      Text('Vantagens',
                        style: TextStyle(
                            fontSize: 16.67,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text('O seguro agrícolas atua em diversos estados do Brasil, De acordo com o produto...'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Mais informações'),
                      SizedBox(
                        height: 10,
                        child: Divider(),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset('images/coins.png', scale: 11.0,),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('R\$ 11.000,00', style: TextStyle(fontWeight: FontWeight.w700,),),
                            SizedBox(
                              width: 120.0,
                            ),
                            Image.asset('images/whats.png', scale: 1.5,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedButton2(
                  title: 'AVANÇAR',
                  colour: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, InicioScreen.id);
                  },
                )

              ],
            ),
          ),
        ],
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
