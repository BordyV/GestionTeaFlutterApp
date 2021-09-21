import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/view/teaList/table_tea_widget.dart';
import 'package:flutter_tea_gestion/view/teaList/tea_filter.dart';
import 'package:http/http.dart' as http;

class TeaList extends StatefulWidget {
  const TeaList({Key? key}) : super(key: key);

  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  List<Tea> _listTea = [];

  List<Tea> _listTeaFilter = [];

  void _parseTeaListFromJson() async {
    var url = Uri.parse(dotenv.env['fournisseur'] ?? "");
    http.Response response = await http.get(url);
    List<dynamic> teasJson = jsonDecode(response.body);
    List<Tea> teas = teasJson.map<Tea>((json) => Tea.fromJson(json)).toList();

    setState(() {
      _listTea = teas;
      _listTeaFilter = teas;
    });
  }

  void _filterTeaList(String newSearchResult) {
    setState(() {
      _listTeaFilter = (newSearchResult.isEmpty)
          ? _listTea
          : _listTea
              .where((tea) =>
                  tea.name
                      .toUpperCase()
                      .contains(newSearchResult.toUpperCase()) ||
                  tea.reference
                      .toString()
                      .toUpperCase()
                      .contains(newSearchResult.toUpperCase()))
              .toList();
    });
  }

  @override
  void initState() {
    _parseTeaListFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tea Gestion : '),
        ),
        body:  SingleChildScrollView(
                child: Column(children: <Widget>[
          TeaFilter(filterNameRef: _filterTeaList),
          TableTeaWidget(listTea: _listTeaFilter),
        ])));
  }
}
