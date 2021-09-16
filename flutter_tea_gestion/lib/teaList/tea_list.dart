import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:flutter_tea_gestion/teaList/table_tea_widget.dart';
import 'package:flutter_tea_gestion/teaList/tea_filter.dart';
import 'package:provider/provider.dart';

class tealist extends StatefulWidget {
  const tealist({Key? key}) : super(key: key);

  @override
  _tealistState createState() => _tealistState();
}

class _tealistState extends State<tealist> {
  @override
  Widget build(BuildContext context) {
    //context.read<TeaService> est l'équivalent de Provider.of<TeaService>
    //read = listen: false || watch = listen: true
    //https://stackoverflow.com/questions/59898274/flutter-provider-access-via-addpostframecallback-says-widget-is-outside-the-widg
    //https://pub.dev/packages/provider#:~:text=Reading%20a%20value,part%20of%20T.
    late Future<List<Tea>> teaFuture = context.read<TeaService>().exampleApi();

    return MaterialApp(
        title: 'Gestion Tea',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Gestion Tea'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            teaFilter(),
            Flexible(
              child: FutureBuilder<List<Tea>>(
                future: teaFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TableTeaWidget(
                        listTea: context.watch<TeaService>().listTeaFilter);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ])),
        ));
  }
}
