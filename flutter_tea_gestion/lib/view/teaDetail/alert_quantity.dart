import 'package:flutter/material.dart';

class AlertQuantity extends StatelessWidget {
  const AlertQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: const Text('Modifier la quantité'),
      content: TextField(
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: "Quantité à ajouter ou modifier"),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Moins'),
          child: const Text('Moins -'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Plus'),
          child: const Text('Plus +'),
        ),
      ],
    );
  }
}
