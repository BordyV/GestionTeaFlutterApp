import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/search/table_tea_widget.dart';
import 'package:flutter_tea_gestion/search/tea_filter.dart';

class TeaSearchPage extends StatefulWidget {
  const TeaSearchPage({Key? key}) : super(key: key);

  @override
  _TeaSearchPageState createState() => _TeaSearchPageState();
}

class _TeaSearchPageState extends State<TeaSearchPage> {
  List<Tea> _listTea = [];

  List<Tea> _listTeaFilter = [];

  void _parseTeaListFromJson() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/tea_mock.json");
    List<dynamic> teasJson = jsonDecode(data);
    List<Tea> teas = teasJson.map<Tea>((json) => Tea.fromJson(json)).toList();
    setState(() {
      _listTea = teas;
    });
  }

  @override
  void initState() {
    _parseTeaListFromJson();
    super.initState();
  }

  void _filterTeaList(String newSearchResult) {
    setState(() {
      _listTeaFilter = (newSearchResult.isEmpty)
          ? []
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
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      TeaFilter(filterNameRef: _filterTeaList),
      TableTeaWidget(listTea: _listTeaFilter),
    ])));
  }
}
