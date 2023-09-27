import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../router/tab_enum.dart';
import 'menu_item.dart';
// import 'profile_menu_item_widget.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MenuItemWidget(
          title: 'menu.words'.tr(),
          value: TabEnum.words,
        ),
        MenuItemWidget(
          title: 'menu.settings'.tr(),
          value: TabEnum.settings,
        ),
        const LanguageSwitchWidget(
          showText: false,
        ),
        // const ProfileMenuItemWidget(),
      ].alternateWith(const SizedBox(width: 40)).toList(growable: false),
    );
  }
}
