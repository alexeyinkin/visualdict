import 'package:model_fetch/model_fetch.dart';

class WordPublicFilter extends AbstractFilter {
  final String? search;

  const WordPublicFilter({
    this.search,
  });

  @override
  Map<String, dynamic> toJson() => {
    'search': search,
  };
}
