import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

///Provider for Tea
class TeaService with ChangeNotifier {
  late List<Tea> _listTeaCache = [];

  late List<Tea> _listTeaFilter = [];

  List<Tea> get listTeaCache {
    return _listTeaCache;
  }

  List<Tea> get listTeaFilter {
    return _listTeaFilter;
  }

  ///set via =
  set listTeaFilter(List<Tea> newListTeaFilter) {
    _listTeaFilter = newListTeaFilter;
    print(_listTeaFilter);

    notifyListeners();
  }

  /// Get data and parse it
  void exampleApi() async {
    var url = Uri.parse(dotenv.env['fournisseur'] ?? "");
    http.Response response = await http.get(url);
    List<dynamic> teasJson = jsonDecode(response.body);
    List<Tea> teas = teasJson.map<Tea>((json) => Tea.fromJson(json)).toList();

    _listTeaCache = teas;
    _listTeaFilter = teas;
    filterNameRef('');
  }

  void filterNameRef(String nameRef) {
    _listTeaFilter = nameRef.isEmpty ? _listTeaCache : _listTeaCache
        .where((tea) =>
            tea.name.toUpperCase().contains(nameRef.toUpperCase()) ||
            tea.reference
                .toString()
                .toUpperCase()
                .contains(nameRef.toUpperCase()))
        .toList();
    notifyListeners();
  }
}