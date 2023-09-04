import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_dart/common_dart.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';

import '../filters/word_public.dart';
import '../models/word_public.dart';
import 'firestore.dart';
import 'mixin.dart';

const _collection = CollectionsEnum.WordPublic;

class WordPublicFirestoreLoaderFactory
    extends MyFirestoreLoaderFactory<WordPublic, WordPublicFilter> with LoaderFactoryMixin{
  @override
  CollectionReference<Map<String, dynamic>> getCollection() {
    return FirebaseFirestore.instance.collection(_collection.name);
  }

  @override
  WordPublicQueryBuilder createQueryBuilder(WordPublicFilter filter) {
    return WordPublicQueryBuilder(filter, this);
  }

  @override
  WordPublic fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return WordPublic.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }
}

class WordPublicQueryBuilder extends QueryBuilder<WordPublic> {
  final WordPublicFilter filter;
  final WordPublicFirestoreLoaderFactory loaderFactory;

  Query<WordPublic>? _query;

  @override
  Query<WordPublic> get query => _query ?? _createEmptyQuery();

  WordPublicQueryBuilder(this.filter, this.loaderFactory) {
    _addOfTheDay();
    _addSearch();
    _addOrderBy();
    _addLimit();
  }

  void _addOfTheDay() {
    if (filter.ofTheDay == null) {
      return;
    }

    _query = query.where('ofTheDay', isLessThanOrEqualTo: filter.ofTheDay);
  }

  void _addSearch() {
    final search = filter.search;
    if (search == null || search == '') {
      return;
    }

    _query = query.where('ngrams', arrayContains: filter.search);
  }

  void _addOrderBy() {
    final orderBy = filter.orderBy;
    final descending = filter.orderByDescending;
    if (orderBy == null || descending == null) {
      assert(
        orderBy == null && descending == null,
        'Both "orderBy" and "descending" must be null',
      );
      return;
    }

    _query = query.orderBy(orderBy, descending: descending);
  }

  void _addLimit() {
    final n = filter.limit;
    if (n == null) {
      return;
    }

    _query = query.limit(n);
  }

  Query<WordPublic> _createEmptyQuery() {
    return FirebaseFirestore.instance
        .collection(_collection.name)
        .withConverter(
          fromFirestore: loaderFactory.fromFirestoreBase,
          toFirestore: (_, __) => throw UnimplementedError(),
        );
  }
}
