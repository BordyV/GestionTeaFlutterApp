import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class teaFilter extends StatelessWidget {
  const teaFilter({Key? key,}) : super(key: key);


  @override
  build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String _searchResult = '';

    return Card(
      child: ListTile(
        leading: Icon(Icons.search),
        title: TextField(
            controller: controller,
            decoration:
                InputDecoration(hintText: 'Search', border: InputBorder.none),
            onChanged: (value) {
              _searchResult = value;
              Provider.of<TeaService>(context, listen: false)
                  .filterNameRef(_searchResult);

            }),
        trailing: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            controller.clear();
            _searchResult = '';
            Provider.of<TeaService>(context, listen:false).filterNameRef(_searchResult);
          },
        ),
      ),
    );
  }
}
