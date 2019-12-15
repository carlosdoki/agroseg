import 'package:flutter/material.dart';
import 'package:agroseg/contants.dart';
import 'package:agroseg/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_web_browser/flutter_web_browser.dart';

Future<Map> _getData() async {
  final response = await http.post(
    'https://varcom-mp-api-01.matera.com/v1/payments' +
        cpf,
    headers: {
      "X-Api-Key": "813F6952-D615-4E5C-9547-C31ABED75895",
      "Transaction-Hash": "408351c2122dd46d0ba53fc4aa2295d287792fba0098f9153ae4b78ae1ebcfd1",
      HttpHeaders.contentTypeHeader: "application/json"
    },
    body : {
      "totalAmount": "{{TotalAmount}}",
      "currency": "BRL",
      "externalIdentifier": "{{Sequential}}",
      "callbackAddress": "http://www.mediator.com/callbackAPI",
      "sender":
      {
        "client":
        {
          "name": "COMPRADOR -PF- {{Sequential}}",
          "email": "comprador.pf.{{Sequential}}@me.com",
          "taxIdentifier":
          {
            "taxId": "{{individualTaxId}}",
            "country": "BRA"
          },
          "mobilePhone":
          {
            "country": "BRA",
            "phoneNumber": "{{Sequential}}"
          }
        }
      },
      "paymentInfo":
      {
        "transactionType": "Boleto",
        "boleto":
        {
          "bank": "341",
          "accountingMethod": "DEF",
          "shopperStatement": "TEXTO SOB RESPONSABILIDADE DO EMISSOR DO BOLETO (colocar aqui o texto que vai sair no campo 'Instruções')"
        },
        "billingAddress":
        {
          "logradouro":"CUSTOMER STREET {{Sequential}}",
          "numero":"999",
          "bairro":"NEIGHBORHOOD",
          "cidade":"CITY NAME",
          "estado":"SP",
          "cep":"13100000",
          "pais":"BRA"
        }


      },
      "myAccount":
      {
        "accountId": "{{mediatorAccountId}}"
      },
      "recipients":
      [
        {
          "account":
          {
            "accountId": "{{Customer1AccountId}}"
          },
          "amount": "{{AmountCustomer1}}",
          "mediatorFee": "{{mediatorFee1}}",
          "currency": "BRL"
        },
        {
          "account":
          {
            "accountId": "{{Customer2AccountId}}"
          },
          "amount": "{{AmountCustomer2}}",
          "mediatorFee": "{{mediatorFee2}}",
          "currency": "BRL"
        }
      ]
    }
  );

  print(cpf);
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    nomeCompleto = map['Nome'];
    print(map['Nome']);
//    return map;

    return map;
  } else {
    // If that call was not successful, throw an error.
    print(response.statusCode);
    throw Exception('Failed to get');
  }
}


class InicioScreen extends StatefulWidget {
  static String id = 'inicio_screen';

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {

  openBrowserTab() async {
    const url ="https://varcom-mp-01-boletos.s3.us-west-2.amazonaws.com/boleto-F9F8E533-18D7-A984-A7D0-4F04A0B771AD.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJIMEYCIQD9e7OCx39z1HgOMolAFHvfEoWaE3O0irTBRqv8dZwK2gIhANCqkimcnVwo8dpylXW06QdtgyQpvR3%2BKkZyFjMjNsmmKtICCF4QABoMNTM2MzExMDQ0MjE3IgzKhVbM26VoiJoPN7QqrwKn%2F4xmwiQevHfUbbLuJ%2F96Ileyp8kEA23yNCH7P97zMPdOB%2BapGhGVa%2FeNP0BDB0jHM4j3nKiL%2FaY8xyczLL5CIZ9AO%2BLHGd7QQd%2FVTvuU3PxYNL392vms1Zboz1RpWCFiGtuNWZpxOQcUx5RN2Fr8NasjY9QcO6e0njLJ52LIhImb%2BMGrm0Gj3uYPd%2FIkfP0LPcTNpDF87lhs33GhS%2B%2BSgGVyRE8hhzJvEnN2V2GgNU0YDyVoskQ%2BSqGR7AsUED1OuZZdeMw1KGPvMixoRCLE7lWbfH31eOG7TsPBS6ZZ50Ll3pcqpf2to3bkaltebhmVZw3aVbgsgfUg3JzRvmesEi0FDyXXIWv%2Fgi4R40QcmvBgP3kRLUns8UOipfOFdYY0uwbHcjg%2FDrifD%2Fd4l5Mw7tnY7wU6zALBbTyKyjfjin1qipePNWFzX83G%2Boj8NoF4kTNrNPWijEWqsx7Htixu%2F7FDJFM7%2FBYdvVwhNraYEmB6b5flXSOtfNm4gruHBB8rnwNVWc5%2FCB%2FNjSoHIAQT9heKkSbUEo6QFE3ZsQ3uQFjpAz8lW7D9NsHrzZK3aOxJxFvOYg4rbW4PXK250EikeVIozp5HggwKXvkckh9iyTisxxFEouXL3R24AtRq2TLHasWwj3%2BwsL7dxAvq91J%2BkYHh%2BTmw%2FvkAWCIOxkAnsfBFRUSDffB7KqkOMyJXQ5In1DmHNOs%2BpfaaVsknMFXUhSXnP7elWAgfliX5Cb7fyXNQw%2FvDL4UOmZRwHWKUPyCNruA90NvZRNPet6hT0VK5ASyH3MT%2Ff6%2F1Pe3W9YwWBXgO8vmnRskIBwGmSOqejOkZfAhisWhjleCE6gNQI%2B0DBfXj8w%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20191215T142546Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=ASIAXZXVBDB44D3GXYPN%2F20191215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=0eafa6c63469b7332fc174c93e4f04d2fe8844ad7562fd6492766dd9bf73a6fd";
    await FlutterWebBrowser.openWebPage(url: Uri.encodeFull(url), androidToolbarColor: Colors.deepPurple);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo.png'),
                SizedBox(
                  width: 30.0,
                ),
                Image.asset('images/whats2.png', scale: 2.0,),
              ],
            ),
            color: Color(0xFF8EBC7A),
          ),
          Text('Minhas cotações',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              )),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xFF8EBC7A),
                        )),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Agrícola Avançado', style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(width: 30.0,),
                              ColorizeAnimatedTextKit(
                                alignment: AlignmentDirectional.center,
                                duration: Duration(milliseconds: 1000),
                                text: ['Status: INICIADO'],
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                ),
                                colors: [
                                  Colors.red,
                                  Colors.redAccent,
                                  Colors.deepOrange,
                                  Colors.purpleAccent,
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'O seguro agrícolas atua em diversos estados do Brasil, De acordo com o produto...'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset('images/call-center.png', scale: 14.0,),
                              SizedBox(width: 20.0,),
                              Image.asset('images/medal.png', scale: 14.0,)
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Mais informações'),
                              SizedBox(
                                width: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                child: Material(
                                  elevation: 3.0,
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: MaterialButton(
                                    onPressed: () => openBrowserTab(),
                                    minWidth: 160.0,
                                    height: 25.0,
                                    child: Text(
                                      'Ver Boleto',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 300,
                    child: Divider(),
                  ),
                  Text(
                    'AgroSeg Club',
                    style:
                        TextStyle(fontSize: 16.67, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xFF8EBC7A),
                        )),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Convide e Ganhe 10% de desconto',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Indicando algum seguro rural, você ganha 10% de desconto em sua próxima compra no aplicativo.'),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text('Mais informações'),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Image.asset(
                                            'images/growth.png',
                                            scale: 6.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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


_launchURL() async {
  const url ="https://varcom-mp-01-boletos.s3.us-west-2.amazonaws.com/boleto-F9F8E533-18D7-A984-A7D0-4F04A0B771AD.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAUaCXVzLXdlc3QtMiJIMEYCIQD9e7OCx39z1HgOMolAFHvfEoWaE3O0irTBRqv8dZwK2gIhANCqkimcnVwo8dpylXW06QdtgyQpvR3%2BKkZyFjMjNsmmKtICCF4QABoMNTM2MzExMDQ0MjE3IgzKhVbM26VoiJoPN7QqrwKn%2F4xmwiQevHfUbbLuJ%2F96Ileyp8kEA23yNCH7P97zMPdOB%2BapGhGVa%2FeNP0BDB0jHM4j3nKiL%2FaY8xyczLL5CIZ9AO%2BLHGd7QQd%2FVTvuU3PxYNL392vms1Zboz1RpWCFiGtuNWZpxOQcUx5RN2Fr8NasjY9QcO6e0njLJ52LIhImb%2BMGrm0Gj3uYPd%2FIkfP0LPcTNpDF87lhs33GhS%2B%2BSgGVyRE8hhzJvEnN2V2GgNU0YDyVoskQ%2BSqGR7AsUED1OuZZdeMw1KGPvMixoRCLE7lWbfH31eOG7TsPBS6ZZ50Ll3pcqpf2to3bkaltebhmVZw3aVbgsgfUg3JzRvmesEi0FDyXXIWv%2Fgi4R40QcmvBgP3kRLUns8UOipfOFdYY0uwbHcjg%2FDrifD%2Fd4l5Mw7tnY7wU6zALBbTyKyjfjin1qipePNWFzX83G%2Boj8NoF4kTNrNPWijEWqsx7Htixu%2F7FDJFM7%2FBYdvVwhNraYEmB6b5flXSOtfNm4gruHBB8rnwNVWc5%2FCB%2FNjSoHIAQT9heKkSbUEo6QFE3ZsQ3uQFjpAz8lW7D9NsHrzZK3aOxJxFvOYg4rbW4PXK250EikeVIozp5HggwKXvkckh9iyTisxxFEouXL3R24AtRq2TLHasWwj3%2BwsL7dxAvq91J%2BkYHh%2BTmw%2FvkAWCIOxkAnsfBFRUSDffB7KqkOMyJXQ5In1DmHNOs%2BpfaaVsknMFXUhSXnP7elWAgfliX5Cb7fyXNQw%2FvDL4UOmZRwHWKUPyCNruA90NvZRNPet6hT0VK5ASyH3MT%2Ff6%2F1Pe3W9YwWBXgO8vmnRskIBwGmSOqejOkZfAhisWhjleCE6gNQI%2B0DBfXj8w%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20191215T142546Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=ASIAXZXVBDB44D3GXYPN%2F20191215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=0eafa6c63469b7332fc174c93e4f04d2fe8844ad7562fd6492766dd9bf73a6fd";
//  if (await canLaunch(Uri.encodeFull(url))) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
}