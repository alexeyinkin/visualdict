import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../filters/word_public.dart';
import '../../theme/theme.dart';
import '../layout/h2.dart';
import 'word_grid.dart';

class RecentImagedWordsWidget extends StatelessWidget {
  const RecentImagedWordsWidget();

  @override
  Widget build(BuildContext context) {
    // TODO: Periodic rebuild.
    const filter = WordPublicFilter.recentImaged(3 * 4 * 5);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        H2Widget('RecentImagedWordsWidget.text'.tr()),
        const MySpacing(),
        const WordGridWidget(filter: filter),
      ],
    );
  }
}
