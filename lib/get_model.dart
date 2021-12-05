import 'package:flutter/cupertino.dart';

class Regioni {

  final String data;
//  final int idRegione;
  final String regioneName;
  // final int idProvincia;
  // final String provinciaName;
  // final String sigla;
   final int casi;
  // final String note;
  bool isExpanded;

  Regioni({
       required this.data,
      // required this.stato,
    //  required this.idRegione,
       required this.regioneName,
    //   required this.idProvincia,
    //   required this.provinciaName,
    //   required this.sigla,
       required this.casi,
    //   required this.note,

    this.isExpanded = false,
      });

  factory Regioni.fromJson(Map<String, dynamic>json){
    return Regioni(
         data: json['data'] as String,
        // stato: json['stato'] as String,
      //  idRegione: json['idRegione'] as int,
        regioneName: json['denominazione_regione'] as String,
        // idProvincia: json['idProvincia'] as int,
        // provinciaName: json['provinciaName'] as String,
        // sigla: json['sigla'] as String,
         casi: json['totale_casi'] as int,
        // note: json['note'] as String,

    );
  }
}

