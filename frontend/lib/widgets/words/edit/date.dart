import 'package:flutter/material.dart';

import '../../../controllers/date.dart';
import '../../buttons/calendar.dart';

class DateEditWidget extends StatelessWidget {
  final DateEditingController controller;

  const DateEditWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller.textController,
          ),
        ),
        CalendarButton(onPressed: controller.setToday),
      ],
    );
  }
}
