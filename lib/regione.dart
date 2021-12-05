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
  late Future<List<Regioni>> _future;
  @override
  void initState(){
    _future = httpService.getProvince();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regioni"),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Regioni>> snapshot ){
          if (snapshot.hasData) {
            List<Regioni> regioni = snapshot.requireData;
            return ListView(
              children: regioni.map((Regioni regione) =>
                  ExpansionTile(
                    title: Text(regione.regioneName),
                    children: const [
                      ListTile() //finire di aggiungere qui
                    ],
                  ),).toList(),
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




