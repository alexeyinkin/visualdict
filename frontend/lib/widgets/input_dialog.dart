import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  final String title;

  const InputDialog({
    required this.title,
  });

  static Future<String?> show({
    required BuildContext context,
    required String title,
  }) async {
    return showDialog(
      context: context,
      builder: (_) => InputDialog(
        title: title,
      ),
    );
  }

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        onSubmitted: (_) => _ok(),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _ok,
          child: const Text('OK'),
        ),
      ],
    );
  }

  void _ok() {
    Navigator.pop(context, _controller.text);
  }
}
