import 'package:flutter/material.dart';

import '../../controllers/app_delegate.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import '../../util/build_context.dart';
import '../loading/small_circular_progress_indicator.dart';
import '../logo.dart';
import '../search/search_form.dart';
import 'constrained_width.dart';
import 'footer.dart';
import 'horizontal_black_line.dart';
import 'my_padding.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final AppDelegate delegate;
  final double? maxWidth;
  final bool padding;
  final BodySize bodySize;

  const MyScaffold({
    required this.body,
    required this.delegate,
    required this.bodySize,
    this.maxWidth,
    this.padding = true,
  });

  const MyScaffold.loading({
    required this.delegate,
    this.maxWidth,
    this.padding = true,
  })  : bodySize = BodySize.infinite,
        body = const Center(
          child: SmallCircularProgressIndicator(),
        );

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

    child = switch (bodySize) {
      BodySize.finite => SingleChildScrollView(
          child: Column(
            children: [
              child,
              const HorizontalBlackLine(),
              const FooterWidget(),
            ],
          ),
        ),
      BodySize.infinite => Column(
          children: [
            Expanded(child: child),
            const HorizontalBlackLine(),
            const FooterWidget(),
          ],
        ),
    };

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
                      _NarrowHeader(delegate: delegate)
                    else
                      _WideHeader(delegate: delegate),
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
  final AppDelegate delegate;

  const _NarrowHeader({
    required this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      color: ext.headerColor,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          LogoWidget(
            onTap: delegate.goHome,
            size: 44, // Empirical from search field height.
            textVisible: false,
          ),
          SizedBox(width: 10),
          Expanded(
            child: SearchForm(
              onSelected: delegate.showWord,
            ),
          ),
        ],
      ),
    );
  }
}

class _WideHeader extends StatelessWidget {
  final AppDelegate delegate;

  const _WideHeader({
    required this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      color: ext.headerColor,
      child: Row(
        children: [
          const SizedBox(width: 30),
          LogoWidget(
            onTap: delegate.goHome,
            size: 40,
            textVisible: true,
          ),
          const SizedBox(width: 30),
          Expanded(
            child: SearchForm(
              onSelected: delegate.showWord,
            ),
          ),
          const SizedBox(width: 30),
          delegate.getMenu(),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

enum BodySize {
  /// The body is finite and defines its own height.
  /// It is Container, Column, a shrink-wrapped ListView, etc.
  /// The footer goes after the body and is not initially visible on long pages.
  finite,

  /// The body is infinite and must be given a finite viewport.
  /// It is a non-shrink-wrapped ListView, a SingleChildScrollView,
  /// a column with Expanded, etc.
  /// The footer sticks to the bottom and is always visible.
  infinite,
}
