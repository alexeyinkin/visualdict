import 'dart:async';

//import 'package:rxdart/rxdart.dart';

import '../models/toast.dart';
import '../models/toast_type.dart';

class ToastNotifier {
  //final _controller = BehaviorSubject<Toast>();
  final _controller = StreamController<Toast>();

  Stream<Toast> get toasts => _controller.stream;

  void add(Toast toast) {
    _controller.add(toast);
  }

  void addThrowable(Object error) {
    add(
      Toast(
        title: 'Error',
        description: error.toString(),
        type: ToastType.error,
      ),
    );
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
