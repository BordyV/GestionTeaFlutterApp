import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:provider/src/provider.dart';

class teaDetail extends StatefulWidget {
  const teaDetail({Key? key}) : super(key: key);

  @override
  _teaDetailState createState() => _teaDetailState();
}

class _teaDetailState extends State<teaDetail> {
  @override
  Widget build(BuildContext context) {
    if (context.read<TeaService>().teaDetail != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Detail du thé : '),
          ),
          body: Center(
              child: Text(context.read<TeaService>().teaDetail.toString())));
    } else {
      Navigator.pushNamed(context, '/detail'); // ou probleme ici
      return Text("test");
    }
  }
}
