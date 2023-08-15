import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import '../../widgets/my_scaffold.dart';
import 'state.dart';

const _mockText = 'Senior.dev tracks your public GitHub activity and provides '
    'the statistics that is not readily available in the GitHub UI. '
    'Sign in and share your profile link with your friends!\n\n'
    'Terms of use: We store only your public information that you '
    'share on GitHub and your private email on GitHub. Your private data '
    'is stored securely on a U.S. server. To delete your private data, '
    'send an email to leha@inkin.ru\n\n'
    '© Alexey Inkin, 2022–2023';

class AboutScreen extends StatelessWidget {
  final AboutNotifier notifier;

  const AboutScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>();

    return MyScaffold(
      maxWidth: MySizes.maxPageWidth,
      scrolls: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "About us",
            style: ext?.h2,
            textAlign: TextAlign.center,
          ),
          const MySpacing(),
          const Flexible(
            child: Text(
              _mockText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
