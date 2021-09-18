import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:provider/src/provider.dart';

class teaDetail extends StatelessWidget {
  const teaDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teaDetailData = ModalRoute.of(context)!.settings.arguments == null
        ? "NULL"
        : ModalRoute.of(context)!.settings.arguments as Tea;

    if (teaDetailData != "NULL") {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Detail du thé : '),
          ),
          body: Center(child: Text(teaDetailData.toString())));
    } else {
      //Navigator.pop(context); // ou probleme ici
      return Scaffold(
          appBar: AppBar(
            title: const Text('Detail du thé : '),
          ),
          body: Center(child: Text("Problème lors du chargement de la page")));
    }
  }
}
