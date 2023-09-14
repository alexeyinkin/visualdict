import 'package:model_fetch/model_fetch.dart';
import 'package:version/version.dart';

import '../models/global.dart';
import '../models/versions.dart';
import 'mixin.dart';

class GlobalMockLoaderFactory
    extends LoaderFactory<String, Global, AbstractFilter>
    with LoaderFactoryMixin {
  @override
  ModelByIdBloc<String, Global> createFrozenByIdBloc(String id) {
    throw UnimplementedError();
  }

  @override
  LazyLoadBloc<Global> createFrozenListBloc(AbstractFilter filter) {
    throw UnimplementedError();
  }

  @override
  ModelByFilterBloc<String, Global> createFrozenModelByFilterBloc(
    AbstractFilter filter,
  ) {
    throw UnimplementedError();
  }

  @override
  ModelByIdBloc<String, Global> createLiveByIdBloc(String id) {
    return FixedModelByIdBloc(
      getter: () => Global(
        versions: Versions(min: Version.parse('0.1.0')),
      ),
    );
  }

  @override
  LazyLoadBloc<Global> createLiveListBloc(AbstractFilter filter) {
    throw UnimplementedError();
  }

  @override
  ModelByFilterBloc<String, Global> createLiveModelByFilterBloc(
    AbstractFilter filter,
  ) {
    throw UnimplementedError();
  }
}
