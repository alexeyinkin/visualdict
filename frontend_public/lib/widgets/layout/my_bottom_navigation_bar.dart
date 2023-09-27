import 'package:app_state/app_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyed_collection_widgets/keyed_collection_widgets.dart';

import '../../router/tab_enum.dart';
// import 'user/current_userpic.dart';
// import 'user/raw_userpic.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    required this.pageStacks,
  });

  final PageStacks pageStacks;

  @override
  Widget build(BuildContext context) {
    final tab = TabEnum.values.byName(pageStacks.currentStackKey!);

    return KeyedBottomNavigationBar<TabEnum>(
      currentItemKey: tab,
      keyOrder: const [TabEnum.words, TabEnum.settings],
      onTap: _onTabTap,
      //TODO(morozov): https://github.com/alexeyinkin/flutter-keyed-collection-widgets/issues/1
      items: UnmodifiableTabEnumMap(
        // me: BottomNavigationBarItem(
        //   icon: CurrentUserPicWidget(size: sizeUserPicS),
        //   label: "Me",
        // ),
        words: BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: 'menu.words'.tr(),
        ),
        settings: BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'menu.settings'.tr(),
        ),
      ),
    );
  }

  void _onTabTap(TabEnum tab) {
    final key = tab.name;

    if (pageStacks.currentStackKey == key) {
      pageStacks.currentStack?.popUntilBottom();
    } else {
      pageStacks.setCurrentStackKey(key);
    }
  }
}
