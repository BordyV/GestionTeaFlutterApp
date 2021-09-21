import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:provider/src/provider.dart';

class TeaFilter extends StatefulWidget {
  const TeaFilter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TeaFilterState();
}

class _TeaFilterState extends State<TeaFilter> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.search),
        title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: (value) {
              context.read<TeaService>().filterNameRef(value);
            }),
        trailing: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controller.clear();
          },
        ),
      ),
    );
  }
}
