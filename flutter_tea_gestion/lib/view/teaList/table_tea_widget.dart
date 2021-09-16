import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/service/table_tea_service.dart';
import 'package:flutter_tea_gestion/service/tea_service.dart';
import 'package:provider/src/provider.dart';

class TableTeaWidget extends StatelessWidget {
  TableTeaWidget({required this.listTea});

  final List<Tea> listTea;

  @override
  Widget build(BuildContext context) {
    final _dtSource = TeaDataTableSource(
        onRowSelect: (teaDetail) => {
              context.read<TeaService>().teaDetail = teaDetail, //probleme ici
              Navigator.pushNamed(context, '/detail')
            },
        teaData: listTea);

    return ConstrainedBox(
        constraints:
            BoxConstraints.expand(width: MediaQuery.of(context).size.width),
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
        ));
  }
}
