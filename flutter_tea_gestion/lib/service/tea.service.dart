import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

///Provider for Tea
class TeaService with ChangeNotifier {
  late List<Tea> _listTeaCache;

  late List<Tea> _listTeaFilter;

  List<Tea> get listTeaCache {
    return _listTeaCache;
  }

  List<Tea> get listTeaFilter {
    return _listTeaFilter;
  }

  ///set via =
  set listTeaFilter(List<Tea> newListTeaFilter) {
    _listTeaFilter = newListTeaFilter;
    notifyListeners();
  }

  /// Get data and parse it
  Future<List<Tea>> exampleApi() async {
    var url = Uri.parse(dotenv.env['fournisseur'] ?? "");
    http.Response response = await http.get(url);
    print("Get Tea success ${response.body.length}");

    return parseTeas(response.body);
  }

  List<Tea> parseTeas(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    _listTeaCache = parsed.map<Tea>((json) => Tea.fromJson(json)).toList();
    _listTeaFilter = _listTeaCache;
    return _listTeaFilter;
  }

  void filterNameRef(String nameRef) {
    _listTeaFilter = _listTeaCache
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
