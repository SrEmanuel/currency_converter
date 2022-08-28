import 'package:currency_converter/main.dart';
import 'package:currency_converter/pages/curreny_main_page.dart';
import 'package:flutter/material.dart';

class CurrencyHomePage extends StatefulWidget {
  const CurrencyHomePage({Key? key}) : super(key: key);

  @override
  State<CurrencyHomePage> createState() => _CurrencyHomePageState();
}

class _CurrencyHomePageState extends State<CurrencyHomePage> {

  Color mainColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "\$ Conversor \$",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Carregando dados',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 25.0
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if(snapshot.hasError){
                return Center(
                  child: Text(
                    'Erro ao carregar os dados :/',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 25.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return MainPage(snapshot: snapshot.data as Map<dynamic, dynamic>);
              }
          }
        }
      ),
    );
  }
}

