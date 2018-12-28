import 'package:flutter/material.dart';
import 'package:flutter_crypto/home_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new cryptoApp(currencies) );
}

class cryptoApp extends StatelessWidget{

  final List _currencies;
  cryptoApp(this._currencies);

  @override
  Widget build(BuildContext context){
      return new MaterialApp(
        theme : new ThemeData(
          primarySwatch: Colors.pink
        ),
        home : new HomePage(_currencies),

      );
  }
}

Future<List> getCurrencies() async{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);
  return  json.decode(response.body);
}
