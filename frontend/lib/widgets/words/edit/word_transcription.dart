import 'package:flutter/material.dart';

class WordTranscriptionEditWidget extends StatelessWidget {
  final TextEditingController controller;

  const WordTranscriptionEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('/'),
        SizedBox(
          width: 150,
          child: TextField(
            controller: controller,
          ),
        ),
        const Text('/'),
      ],
    );
  }
}
