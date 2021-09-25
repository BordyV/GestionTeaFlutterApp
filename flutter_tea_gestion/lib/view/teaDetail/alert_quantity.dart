import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertQuantity extends StatelessWidget {
  const AlertQuantity(
      {Key? key, required this.addQuantityRef, required this.deleteQuantityRef})
      : super(key: key);
  final Function(int) addQuantityRef;
  final Function(int) deleteQuantityRef;

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: const Text('Modifier la quantité'),
      content: TextField(
        controller: _textFieldController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: const InputDecoration(hintText: "Quantité à modifier"),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Annuler'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            deleteQuantityRef(int.parse(_textFieldController.text)),
            Navigator.pop(context, 'Moins')
          },
          child: const Text('Moins -'),
        ),
        TextButton(
          onPressed: () => {
            addQuantityRef(int.parse(_textFieldController.text)),
            Navigator.pop(context, 'Plus')
          },
          child: const Text('Plus +'),
        ),
      ],
    );
  }
}
