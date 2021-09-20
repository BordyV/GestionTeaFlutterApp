import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/service/tabletea_service.dart';

class TableTeaWidget extends StatelessWidget {
  const TableTeaWidget({required this.listTea});

  final List<Tea> listTea;

  @override
  Widget build(BuildContext context) {
    final _dtSource = TeaDataTableSource(
        onRowSelect: (index) => print("test" + index.toString()),
        teaData: listTea);

    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250),
            child:

                /// filt
                PaginatedDataTable(
              source: _dtSource,
              columns: [
                DataColumn(label: Text('Reference')),
                DataColumn(label: Text('Nom')),
                DataColumn(label: Text('Quantité')),
              ],
              columnSpacing: 10,
              horizontalMargin: 10,
              rowsPerPage: 8,
              showCheckboxColumn: false,
            )));
  }
}
