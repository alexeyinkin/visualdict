import 'package:flutter/widgets.dart';

import '../../models/word_public.dart';
import '../../theme/theme.dart';
import '../clickable.dart';

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

    return ClickableWidget(
      onTap: onTap,
      child: Row(
        children: [
          Text(wordPublic.id),
          const MySpacing(),
          Expanded(
            child: Text(
              firstSense.definition,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
