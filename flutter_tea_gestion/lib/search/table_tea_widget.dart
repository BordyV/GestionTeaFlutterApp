import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/search/tabletea_service.dart';

class TableTeaWidget extends StatelessWidget {
  const TableTeaWidget({Key? key, required this.listTea}) : super(key: key);

  final List<Tea> listTea;

  @override
  Widget build(BuildContext context) {
    final _dtSource = TeaDataTableSource(
        onRowSelect: (index) => print("test" + index.toString()),
        teaData: listTea);

    return ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        child:

            /// filt
            PaginatedDataTable(
          source: _dtSource,
          columns: const [
            DataColumn(label: Text('Reference')),
            DataColumn(label: Text('Nom')),
            DataColumn(label: Text('Quantité')),
          ],
          columnSpacing: 10,
          horizontalMargin: 10,
          rowsPerPage: 8,
          showCheckboxColumn: false,
        ));
  }
}