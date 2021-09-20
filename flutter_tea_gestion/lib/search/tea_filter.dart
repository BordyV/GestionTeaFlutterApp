import 'package:flutter/material.dart';

class TeaFilter extends StatefulWidget {
  final Function(String) filterNameRef;

  const TeaFilter({Key? key, required this.filterNameRef}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TeaFilterState();
}

class _TeaFilterState extends State<TeaFilter> {
  TextEditingController controller = TextEditingController();

  filterList() {
    widget.filterNameRef(controller.text);
  }

  @override
  void initState() {
    controller.addListener(() {
      filterList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.search),
        title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none)),
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
