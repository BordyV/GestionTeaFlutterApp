import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:flutter_tea_gestion/view/teaList/table_tea_widget.dart';
import 'package:flutter_tea_gestion/view/teaList/tea_filter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/src/provider.dart';

class TeaList extends StatefulWidget {
  const TeaList({Key? key}) : super(key: key);

  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  @override
  Widget build(BuildContext context) {
    context.read<TeaService>().exampleApi();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tea Gestion : '),
        ),
        body:  SingleChildScrollView(
                child: Column(children: <Widget>[
          TeaFilter(),
          TableTeaWidget(listTea: context.watch<TeaService>().listTeaFilter),
        ])));
  }
}
