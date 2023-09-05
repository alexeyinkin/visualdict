import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';

class PartOfSpeechDropdown extends StatelessWidget {
  final ValueChanged<PartOfSpeechEnum> onChanged;
  final PartOfSpeechEnum? value;

  const PartOfSpeechDropdown({
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<PartOfSpeechEnum>(
      items: PartOfSpeechEnum.values
          .map(
            (i) => DropdownMenuItem(
              value: i,
              child: Text(i.name),
            ),
          )
          .toList(growable: false),
      onChanged: (v) => onChanged(v!),
      value: value,
    );
  }
}
