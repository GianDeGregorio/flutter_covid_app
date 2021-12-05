import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'get_model.dart';
class HttpService {
  final String getUrl = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni.json";

  Future<List<Regioni>> getProvince() async {
    Response res = await get(Uri.parse("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni.json"));

    if (res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Regioni> regioni = body
          .map(
            (dynamic item) => Regioni.fromJson(item),
      )
          .toList();

      return regioni;
    }else{
      throw Exception("Failed to load");
    }
  }
}