import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'word_grid.dart';

class RecentImagedWordsWidget extends StatelessWidget {
  final bool spacing;

  const RecentImagedWordsWidget({
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Periodic rebuild.
    const filter = WordPublicFilter.recentImaged(3 * 4 * 5);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        H2Widget('RecentImagedWordsWidget.text'.tr()),
        if (spacing) const MySpacing(),
        const WordGridWidget(filter: filter),
      ],
    );
  }
}
