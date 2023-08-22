import 'package:flutter/material.dart';

import '../../main.dart';
import '../../router/tab_enum.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import '../clickable.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    required this.title,
    required this.value,
    this.trailing,
  });

  final String title;
  final Widget? trailing;
  final TabEnum value;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return StreamBuilder(
      stream: pageStacks.events,
      builder: (context, snapshot) {
        return ClickableWidget(
          onTap: () => _onTabTap(value),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: ext.menuItem),
                  if (trailing != null) ...[const MySpacing(), trailing!],
                ],
              ),
              if (_isSelected()) Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: ColoredBox(
                  color: ext.menuItem.color!,
                  child: SizedBox(height: 4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _isSelected() {
    return pageStacks.currentStackKey == value.name;
  }

  static void _onTabTap(TabEnum tab) {
    final key = tab.name;

    if (pageStacks.currentStackKey == key) {
      pageStacks.currentStack?.popUntilBottom();
    } else {
      pageStacks.setCurrentStackKey(key);
    }
  }
}
