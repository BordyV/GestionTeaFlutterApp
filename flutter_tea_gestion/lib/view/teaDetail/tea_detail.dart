import 'package:flutter/material.dart';

class teaDetail extends StatefulWidget {
  const teaDetail({Key? key}) : super(key: key);

  @override
  _teaDetailState createState() => _teaDetailState();
}

class _teaDetailState extends State<teaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail du thé : '),
        ),
        body: Center());
  }
}
