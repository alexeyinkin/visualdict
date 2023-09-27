import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';

class DateEditingController extends ValueNotifier<DateTime?> {
  final textController = TextEditingController();

  DateEditingController() : super(null);

  @override
  DateTime? get value {
    return yyyyMmDdToUtcDateTime(textController.text.trim());
  }

  @override
  set value(DateTime? newValue) {
    textController.text = dateTimeToYyyyMmDd(newValue) ?? '';
    notifyListeners();
  }

  void setToday() {
    final now = DateTime.now();
    value = DateTime.utc(now.year, now.month, now.day);
  }
}
