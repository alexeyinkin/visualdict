import 'package:common_dart/common_dart.dart';
import 'package:flutter/material.dart';
import 'package:model_editors/model_editors.dart';

import '../../../controllers/lang.dart';
import '../../../controllers/translation.dart';
import '../../../theme/theme.dart';
import 'lang.dart';
import 'translation.dart';

class TranslationLineEditWidget extends StatelessWidget {
  final MapEntryController<
      String,
      Translation,
      LangEditingController,
      TranslationEditingController
      //
      > controller;

  const TranslationLineEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MySpacing(),
        SizedBox(
          width: 30,
          child: LangEditWidget(
            controller: controller.keyController,
          ),
        ),
        const MySpacing(),
        Expanded(
          child: TranslationEditWidget(
            controller: controller.valueController,
          ),
        ),
      ],
    );
  }
}
