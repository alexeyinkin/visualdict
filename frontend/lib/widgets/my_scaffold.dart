import 'package:flutter/material.dart';

import '../theme/my_theme_extension.dart';
import '../theme/theme.dart';
import '../util/build_context.dart';
import 'layout/constrained_width.dart';
import 'loading/small_circular_progress_indicator.dart';
import 'logo.dart';
import 'menu/top_menu.dart';
import 'search/search_form.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    required this.body,
    required this.scrolls,
    this.maxWidth,
    this.padding = true,
  });

  const MyScaffold.loading({
    required this.scrolls,
    this.maxWidth,
    this.padding = true,
  }) : body = const Center(
          child: SmallCircularProgressIndicator(),
        );

  final Widget body;
  final double? maxWidth;
  final bool padding;
  final bool scrolls;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileScreen();

    Widget child = body;

    if (maxWidth != null) {
      child = ConstrainedWidthWidget(
        maxWidth: maxWidth,
        child: child,
      );
    }

    if (padding) {
      child = MyPadding(child: child);
    }

    if (scrolls) {
      child = SingleChildScrollView(child: child);
    }

    return Stack(
      children: [
        Scaffold(
          body: ColoredBox(
            color: MyColors.colorBlack,
            child: SafeArea(
              child: ColoredBox(
                color: MyColors.colorWhite,
                child: Column(
                  children: [
                    if (isMobile)
                      const _NarrowHeader()
                    else
                      const _WideHeader(),
                    const HorizontalBlackLine(),
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // if (EnvironmentBanner.isShowing) const EnvironmentBanner(),
      ],
    );
  }
}

class _NarrowHeader extends StatelessWidget {
  const _NarrowHeader();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      alignment: Alignment.center,
      color: ext.headerColor,
      width: double.infinity,
      child: const LogoWidget(),
    );
  }
}

class _WideHeader extends StatelessWidget {
  const _WideHeader();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      alignment: Alignment.center,
      color: ext.headerColor,
      width: double.infinity,
      child: const Row(
        children: [
          SizedBox(width: 30),
          LogoWidget(),
          SizedBox(width: 30),
          Expanded(
            child: SearchForm(),
          ),
          SizedBox(width: 30),
          TopMenuWidget(),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
