import 'package:flutter/material.dart';

import '../../models/toast.dart';
import '../../models/toast_type.dart';
import '../../theme/theme.dart';

const _colors = UnmodifiableToastTypeMap(
  error: MyColors.error,
  info: MyColors.notificationColor,
);

class ToastWidget extends StatelessWidget {
  final Toast toast;

  const ToastWidget(this.toast);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: toast.type == ToastType.error ? _colors.error : _colors.info,
      child: Column(
        children: [
          Text(toast.title),
          const SizedBox(height: AppStyle.padding),
          Text(toast.description),
        ],
      ),
    );
  }
}
