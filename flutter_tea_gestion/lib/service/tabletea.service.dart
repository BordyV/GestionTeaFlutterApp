import 'package:flutter/material.dart';
import 'package:flutter_tea_gestion/model/tea.model.dart';

typedef OnRowSelect = void Function(int index);

//https://github.com/AseemWangoo/experiments_with_web/blob/master/lib/data_table/utilities/data_table_source.dart
class TeaDataTableSource extends DataTableSource {
  TeaDataTableSource({
    required List<Tea> teaData,
    required this.onRowSelect,
  })  : _teaData = teaData;

  final List<Tea> _teaData;
  final OnRowSelect onRowSelect;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= _teaData.length) {
      return null;
    }
    final _tea = _teaData[index];

    return DataRow.byIndex(
      index: index, // DONT MISS THIS
      cells: <DataCell>[
        DataCell(Text('${_tea.reference}')),
        DataCell(Text('${_tea.name}')),
        DataCell(Text('${_tea.buyingPrice}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _teaData.length;

  @override
  int get selectedRowCount => 0;

  /*
   *
   * Sorts this list according to the order specified by the [compare] function.
    The [compare] function must act as a [Comparator].
    List<String> numbers = ['two', 'three', 'four'];
// Sort from shortest to longest.
    numbers.sort((a, b) => a.length.compareTo(b.length));
    print(numbers);  // [two, four, three]
    The default List implementations use [Comparable.compare] if [compare] is omitted.
    List<int> nums = [13, 2, -11];
    nums.sort();
    print(nums);  // [-11, 2, 13] 
   */
  void sort<T>(Comparable<T> Function(Tea d) getField, bool ascending) {
    _teaData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }
}