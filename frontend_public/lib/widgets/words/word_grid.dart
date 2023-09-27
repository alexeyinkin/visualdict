import 'dart:math';

import 'package:common_dart/common_dart.dart';
import 'package:common_dart_frontend/common_dart_frontend.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:model_fetch_flutter/model_fetch_flutter.dart';

import 'word_grid_card.dart';

class WordGridWidget extends StatelessWidget {
  final WordPublicFilter filter;

  const WordGridWidget({
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    final bloc =
        GetIt.instance.get<WordPublicLoaderFactory>().frozenListBloc(filter);

    return CollectionBlocBuilder<WordPublic>(
      bloc: bloc,
      builder: (context, state) => _buildWithState(bloc, state),
    );
  }

  Widget _buildWithState(LazyLoadBloc bloc, CollectionState<WordPublic> state) {
    if (state.items.isEmpty) {
      // TODO: Show "Nothing found. Expand your search".
      return _getTrailing(bloc);
    }

    return LayoutBuilder(
      builder: (context, constraints) =>
          _buildWithStateAndConstraints(bloc, state, constraints),
    );
  }

  Widget _buildWithStateAndConstraints(
    LazyLoadBloc bloc,
    CollectionState<WordPublic> state,
    BoxConstraints constraints,
  ) {
    final crossAxisCount = max(constraints.maxWidth ~/ WordGridCard.minSize, 1);
    final count = state.hasMore ? state.items.length + 1 : state.items.length;

    return GridView.builder(
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, i) {
        if (i == state.items.length) {
          return _getTrailing(bloc);
        }

        return WordGridCard(state.items[i]);
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  Widget _getTrailing(LazyLoadBloc bloc) {
    return BlocAutoLoadMoreWidget(
      bloc: bloc,
      loadingBuilder: (_, __) => const SmallCircularProgressIndicator(),
    );
  }
}
