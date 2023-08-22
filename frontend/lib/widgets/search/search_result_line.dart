import 'package:flutter/material.dart';

import '../../models/word_public.dart';
import '../../theme/theme.dart';

class SearchResultLine extends StatelessWidget {
  final VoidCallback onTap;
  final WordPublic wordPublic;

  const SearchResultLine({
    required this.onTap,
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    final firstSenses = wordPublic.partOfSpeechSenses.first;
    final firstSense = firstSenses.senses.first;

    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            wordPublic.id,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const MySpacing(),
          Expanded(
            child: Opacity(
              opacity: .5,
              child: Text(
                firstSense.definition,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
