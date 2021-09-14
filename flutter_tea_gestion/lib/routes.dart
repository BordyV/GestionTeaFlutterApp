  
import 'package:flutter/widgets.dart';
import 'teaList/tealist.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => tealist()
};