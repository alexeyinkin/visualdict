import 'package:model_interfaces/model_interfaces.dart';

import 'versions.dart';

class Global implements WithId<String> {
  @override
  String get id => singleId;

  final Versions versions;

  const Global({
    required this.versions,
  });

  static const singleId = 'Global';

  factory Global.fromMap(Map<String, dynamic> map) {
    return Global(
      versions: Versions.fromMap(map['versions']),
    );
  }
}
