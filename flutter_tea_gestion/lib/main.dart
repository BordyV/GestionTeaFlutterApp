import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tea_gestion/search/tea_search_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
      title: 'Gestion Tea',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Search Tea'),
          ),
          body: const TeaSearchPage())));
}
