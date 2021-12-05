import 'package:flutter/material.dart';
import 'package:flutter_app/get_model.dart';
import 'package:flutter_app/make_call.dart';

class RegioniPage extends StatefulWidget {
  const RegioniPage({Key? key}) : super(key: key);

  @override
  _RegioniPageState createState() => _RegioniPageState();
}

class _RegioniPageState extends State<RegioniPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regioni"),
      ),
      body: FutureBuilder(
        future: httpService.getProvince(),
        builder: (BuildContext context, AsyncSnapshot<List<Regioni>> snapshot ){
          if (snapshot.hasData) {
            List<Regioni> regioni = snapshot.requireData;
            return ListView(
              children: regioni.map((Regioni regione) => ListTile(title: Text(regione.regioneName),),).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
   }
}




