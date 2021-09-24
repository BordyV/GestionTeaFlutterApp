import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tea_gestion/model/tea_model.dart';

class formDetail extends StatelessWidget {
  formDetail({Key? key, required this.teaDet, required this.readOnly})
      : super(key: key);

  final Tea teaDet;
  final bool readOnly;
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
              readOnly: readOnly,
              initialValue: teaDet.reference.toString(),
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
              readOnly: readOnly,
              initialValue: teaDet.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrez un nom de thé';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nom", icon: Icon(Icons.emoji_food_beverage))),
          //input totalQuantity
          Focus(
            child: TextFormField(
                readOnly: readOnly,
                initialValue: teaDet.totalQuantity.toString(),
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
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          TextFormField(
            readOnly: readOnly,
            initialValue: teaDet.buyingPrice.toString(),
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
                labelText: "Prix", icon: Icon(Icons.euro_symbol)),
          ),
          TextFormField(
            readOnly: readOnly,
            maxLines: 3,
            initialValue: teaDet.description,
            decoration: InputDecoration(
                labelText: "Description", icon: Icon(Icons.description)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
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
