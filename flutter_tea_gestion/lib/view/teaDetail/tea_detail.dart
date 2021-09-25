import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/view/teaDetail/form_detail.dart';

class teaDetail extends StatefulWidget {
  const teaDetail({Key? key}) : super(key: key);

  @override
  _teaDetailState createState() => _teaDetailState();
}

class _teaDetailState extends State<teaDetail> {
  bool _readOnly = true;

  @override
  Widget build(BuildContext context) {
    final teaDetailData = ModalRoute.of(context)!.settings.arguments == null
        ? "NULL"
        : ModalRoute.of(context)!.settings.arguments as Tea;

    if (teaDetailData != "NULL") {
      Tea teaDet = teaDetailData as Tea;
      return Scaffold(
          appBar: AppBar(
            title: const Text('Detail du thé : '),
            actions: <Widget>[
              IconButton(
                icon: Icon(_readOnly ? Icons.edit : Icons.edit_off),
                tooltip: 'Edit mode',
                onPressed: () {
                  setState(() {
                    _readOnly = !_readOnly;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(!_readOnly
                          ? 'Mode édition du thé'
                          : 'Mode édition terminé')));
                },
              ),
            ],
          ),
          body: Center(child: FormDetail(teaDet: teaDet, readOnly: _readOnly)));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Detail du thé : '),
          ),
          body: Center(child: Text("Problème lors du chargement de la page.")));
    }
  }
}
