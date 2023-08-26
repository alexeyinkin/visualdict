import 'package:model_fetch/model_fetch.dart';

class WordPublicFilter extends AbstractFilter {
  final String? ofTheDay;
  final String? search;

  final String? orderBy;
  final bool? orderByDescending;
  final int? limit;

  const WordPublicFilter({
    this.ofTheDay,
    this.search,
    //
    this.orderBy,
    this.orderByDescending,
    this.limit,
  });

  const WordPublicFilter.ofTheDay(String this.ofTheDay)
      : search = null,
        orderBy = 'ofTheDay',
        orderByDescending = true,
        limit = 1;

  const WordPublicFilter.recentImaged(int this.limit)
      : ofTheDay = null,
        search = null,
        orderBy = 'image.timestamp',
        orderByDescending = true;

  @override
  Map<String, dynamic> toJson() => {
        'ofTheDay': ofTheDay,
        'search': search,
        'orderBy': orderBy,
        'orderByDescending': orderByDescending,
        'limit': limit,
      };
}
