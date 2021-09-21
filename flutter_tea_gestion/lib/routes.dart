import 'package:flutter/widgets.dart';
import 'package:flutter_tea_gestion/view/teaDetail/tea_detail.dart';
import 'view/teaList/tea_list.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => TeaList(),
  "/detail": (context) => teaDetail()
};
