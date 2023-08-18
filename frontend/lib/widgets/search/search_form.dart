import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:model_fetch/model_fetch.dart';

import '../../filters/word_public.dart';
import '../../loader_factories/word_public.dart';
import '../../models/word_public.dart';
import '../../theme/my_theme_extension.dart';

class SearchForm extends StatefulWidget {
  const SearchForm();

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final controller = SearchFormController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Autocomplete<WordPublic>(
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
                    return ListTile(
                      title: Text(options.elementAt(i).id),
                    );
                  },
                  itemCount: options.length,
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
            style: TextStyle(fontSize: FontSizeEnum.m.size),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
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
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          );
        },
      ),
    );
  }
}

class SearchFormController extends ChangeNotifier {
  final searchFieldController = TextEditingController();
}
