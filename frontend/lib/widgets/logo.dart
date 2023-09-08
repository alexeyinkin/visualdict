import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../router/tab_enum.dart';
import '../theme/my_theme_extension.dart';
import 'clickable.dart';

const _borderRadiusFraction = .1;
const _outline = .05;

class LogoWidget extends StatelessWidget {
  final double size;
  final bool textVisible;

  const LogoWidget({
    required this.size,
    required this.textVisible,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return ClickableWidget(
      onTap: () {
        pageStacks.setCurrentStackKey(TabEnum.words.name);
        pageStacks.currentStack!.popUntilBottom();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(size * _borderRadiusFraction * (1 + _outline)),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(size * _outline),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(size * _borderRadiusFraction),
                  ),
                  child: Image(
                    image: const AssetImage('web/icons/Icon-192.png'),
                    height: size,
                    width: size,
                  ),
                ),
              ),
            ),
          ),
          if (textVisible) ...[
            SizedBox(width: size / 2),
            Text('common.title', style: ext.h1).tr(),
          ],
        ],
      ),
    );
  }
}
