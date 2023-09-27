import 'package:app_state/app_state.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/material.dart';
import 'package:keyed_collection_widgets/keyed_collection_widgets.dart';

import '../../router/tab_enum.dart';

class HomeScreen extends StatefulWidget {
  final PageStacks pageStacks;

  const HomeScreen({
    required this.pageStacks,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: _focusNode,
      selectionControls: materialTextSelectionControls,
      child: StreamBuilder(
        stream: widget.pageStacks.events,
        builder: (context, snapshot) => _buildOnEvent(context),
      ),
    );
  }

  Widget _buildOnEvent(BuildContext context) {
    final tab = TabEnum.values.byNameOrNull(widget.pageStacks.currentStackKey);

    if (tab == null) return const SmallCircularProgressIndicator();

    return Scaffold(
      body: KeyedStack<TabEnum>(
        itemKey: tab,
        children: widget.pageStacks.pageStacks.map(
          (tabString, stack) => MapEntry(
            TabEnum.values.byName(tabString),
            PageStackNavigator(key: ValueKey(tabString), stack: stack),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
