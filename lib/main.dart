import 'dart:convert';

import 'package:currency_converter/pages/currency_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

const String request = "https://api.hgbrasil.com/finance";
Uri requestUri = Uri.parse(request);

void main() {
  runApp(MaterialApp(
      home: CurrencyHomePage(),
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(requestUri);
  return jsonDecode(response.body);
}

