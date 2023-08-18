import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';

import '../filters/word_public.dart';
import '../models/firestore/collections_enum.dart';
import '../models/word_public.dart';
import 'abstract.dart';

const _collection = CollectionsEnum.WordPublic;

class WordPublicLoaderFactory
    extends MyLoaderFactory<WordPublic, WordPublicFilter> {
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
  final WordPublicLoaderFactory loaderFactory;

  Query<WordPublic>? _query;

  @override
  Query<WordPublic> get query => _query ?? _createEmptyQuery();

  WordPublicQueryBuilder(this.filter, this.loaderFactory) {
    _addSearch();
  }

  void _addSearch() {
    if (filter.search != '') {
      _query = query.where('ngrams', arrayContains: filter.search);
    }
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
