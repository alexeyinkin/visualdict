import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_dart/common_dart.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';

import '../models/global.dart';
import 'firestore.dart';
import 'mixin.dart';

const _collection = CollectionsEnum.Global;

class GlobalFirestoreLoaderFactory
    extends MyFirestoreLoaderFactory<Global, AbstractFilter>
    with LoaderFactoryMixin {
  @override
  CollectionReference<Map<String, dynamic>> getCollection() {
    return FirebaseFirestore.instance.collection(_collection.name);
  }

  @override
  QueryBuilder<Global> createQueryBuilder(AbstractFilter filter) {
    throw UnimplementedError();
  }

  @override
  Global fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    return Global.fromMap({'id': snapshot.id, ...?snapshot.data()});
  }
}
