import 'package:common_dart/common_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../filters/word_public.dart';
import '../../loader_factories/word_public.dart';
import 'search_result_line.dart';

class SearchForm extends StatefulWidget {
  final ValueChanged<WordPublic> onSelected;

  const SearchForm({
    required this.onSelected,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final controller = SearchFormController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => RawAutocomplete<WordPublic>(
        //
        textEditingController: controller.searchFieldController,
        focusNode: controller.searchFieldFocusNode,

        onSelected: (WordPublic selection) {
          // debugPrint('You just selected $selection');
        },

        optionsBuilder: (value) async {
          final filter = WordPublicFilter(search: value.text);
          final factory = GetIt.instance.get<WordPublicLoaderFactory>();
          final bloc = factory.frozenListBloc(filter);
          Iterable<WordPublic> result = [];

          bloc.states.listen((CollectionState<WordPublic> state) {
            result = state.items;
          });

          await bloc.loadMoreIfCan();

          return result;
        },

        optionsViewBuilder: (_, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: SizedBox(
                width: constraints.maxWidth,
                child: ListView.builder(
                  itemBuilder: (_, i) {
                    final wordPublic = options.elementAt(i);
                    return SearchResultLine(
                      onTap: () => widget.onSelected(wordPublic),
                      wordPublic: wordPublic,
                    );
                  },
                  itemCount: options.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ),
            ),
          );
        },

        fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            onSubmitted: (_) => onSubmitted(),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                // borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintText: 'search.hint'.tr(),
            ),
          );
        },
      ),
    );
  }
}

class SearchFormController extends ChangeNotifier {
  final searchFieldController = TextEditingController();
  final searchFieldFocusNode = FocusNode();

  WordPublicFilter getWordPublicFilter() {
    return WordPublicFilter(
      search: searchFieldController.text,
    );
  }
}
