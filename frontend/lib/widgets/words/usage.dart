import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../models/word_public.dart';

class UsageWidget extends StatelessWidget {
  final Usage usage;
  final WordPublic wordPublic;

  const UsageWidget(
    this.usage, {
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: '*${usage.text}*',
      physics: const NeverScrollableScrollPhysics(),
      selectable: true,
      shrinkWrap: true,
    );
    // return RichText(
    //   text: TextSpan(
    //     text: usage.text,
    //     style: TextStyle(fontStyle: FontStyle.italic),
    //   ),
    // );
    return Text(usage.text);
  }
}
