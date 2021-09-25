import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';
import 'package:flutter_tea_gestion/view/teaDetail/alert_quantity.dart';

class FormDetail extends StatefulWidget {
  const FormDetail({Key? key, required this.teaDet, required this.readOnly})
      : super(key: key);
  final Tea teaDet;
  final bool readOnly;

  @override
  _FormDetailState createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
  void _deleteQuantity(int quantity) {
    setState(() {
      widget.teaDet.totalQuantity = widget.teaDet.totalQuantity - quantity;
    });
  }

  void _addQuantity(int quantity) {
    setState(() {
      widget.teaDet.totalQuantity = widget.teaDet.totalQuantity + quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //input reference
          TextFormField(
              readOnly: widget.readOnly,
              initialValue: widget.teaDet.reference.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrez une référence';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Reference", icon: Icon(Icons.minimize))),
          //input name
          TextFormField(
              readOnly: widget.readOnly,
              initialValue: widget.teaDet.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrez un nom de thé';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nom", icon: Icon(Icons.emoji_food_beverage))),
          //input totalQuantity
          TextFormField(
              onTap: () {
                if (widget.readOnly) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertQuantity(
                          deleteQuantityRef: _deleteQuantity,
                          addQuantityRef: _addQuantity));
                }
              },
              readOnly: widget.readOnly,
              initialValue: widget.teaDet.totalQuantity.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrez une quantité';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Quantité", icon: Icon(Icons.inventory))),
          //input description
          TextFormField(
            readOnly: widget.readOnly,
            maxLines: 3,
            initialValue: widget.teaDet.description,
            decoration: InputDecoration(
                labelText: "Description", icon: Icon(Icons.description)),
          ),
          //input lane
          TextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.teaDet.lane,
            decoration:
                InputDecoration(labelText: "lane", icon: Icon(Icons.minimize)),
          ),
          //input column
          TextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.teaDet.column,
            decoration: InputDecoration(
                labelText: "column", icon: Icon(Icons.minimize)),
          ),
          //input height
          TextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.teaDet.height,
            decoration: InputDecoration(
                labelText: "height", icon: Icon(Icons.minimize)),
          ),
          //input box
          TextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.teaDet.box,
            decoration:
                InputDecoration(labelText: "box", icon: Icon(Icons.minimize)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('On modifie le thé bipbipboup')),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ),
        ],
      ),
    );
  }
}
