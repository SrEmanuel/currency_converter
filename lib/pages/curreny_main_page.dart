import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.snapshot}) : super(key: key);
  final Map<dynamic, dynamic> snapshot;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late dynamic dolar;
  late dynamic euro;

  void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }
  void _euroChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);

  }

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  @override
  void initState(){
    super.initState();
    dolar = widget.snapshot["results"]["currencies"]["USD"]["buy"];
    euro = widget.snapshot["results"]["currencies"]["EUR"]["buy"];

    print(euro);
  }

  Color mainColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.monetization_on,
                size: 120,
                color: mainColor,
              ),
              buildTextField("Reais", "R\$", mainColor, realController, _realChanged),
              Divider(),
              buildTextField("Dólares", "US\$", mainColor, dolarController, _dolarChanged),
              Divider(),
              buildTextField("Euros", "€", mainColor, euroController, _euroChanged)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, Color mainColor, TextEditingController controller, Function function){
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: (String value){
      function(value);
    },
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: mainColor),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(
          color: mainColor
      )
    ),
    style: TextStyle(
      color: mainColor,
    ),
  );
}
