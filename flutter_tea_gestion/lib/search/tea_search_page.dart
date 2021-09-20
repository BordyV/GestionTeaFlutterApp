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
  final List<Tea> _listTea = [
    Tea(
        name: "Earl Grey",
        reference: 1,
        totalQuantity: 10,
        qrCode: "qrCode",
        description: "Earl Grey",
        flavor: "Black",
        lane: "12A",
        height: "3",
        box: "2",
        buyingPrice: 12.0,
        column: "2"),
    Tea(
        name: "Mint Tea",
        reference: 2,
        totalQuantity: 10,
        qrCode: "qrCode",
        description: "Mint tea of marocco",
        flavor: "Green",
        lane: "11A",
        height: "2",
        box: "1",
        buyingPrice: 7.0,
        column: "1")
  ];

  List<Tea> _listTeaFilter = [];

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
