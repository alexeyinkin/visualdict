import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../models/word_public.dart';

class UsageViewWidget extends StatelessWidget {
  final Usage usage;
  final WordPublic wordPublic;

  const UsageViewWidget(
    this.usage, {
    required this.wordPublic,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: '*💬 ${usage.text}*',
      physics: const NeverScrollableScrollPhysics(),
      selectable: true,
      shrinkWrap: true,
    );
  }
}
