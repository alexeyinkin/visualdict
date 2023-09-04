import 'package:common_dart/common_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:model_editors/model_editors.dart';

import '../../../controllers/commentable.dart';
import '../../../controllers/is_visible.dart';
import '../../../theme/theme.dart';
import '../../buttons/comment.dart';
import '../../buttons/is_visible.dart';
import '../../layout/editor_frame.dart';
import '../../layout/is_visible_frame.dart';
import '../part_of_speech.dart';
import 'comment_field.dart';
import 'word_sense.dart';

class PartOfSpeechSensesEditWidget extends StatelessWidget {
  final PartOfSpeechSensesEditingController controller;

  const PartOfSpeechSensesEditWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    final partOfSpeechSenses = controller.value;

    if (partOfSpeechSenses == null) {
      return Text("null");
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IsVisibleFrame(
          isVisible: controller.isVisible,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PartOfSpeechWidget(partOfSpeechSenses.partOfSpeech),
                  const MySpacing(),
                  IsVisibleToggle(controller: controller),
                  CommentToggle(controller: controller),
                ],
              ),
              CommentField(
                controller: controller,
                padding: MyPaddingEnum.top,
              ),
              const MySpacing(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: EditorFrame(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReorderableListViewEditor(
                        controller: controller.sensesController,
                        itemBuilder: (_, c, index) => EditorFrame(
                          child: WordSenseEditWidget(c, index: index),
                        ),
                        shrinkWrap: true,
                      ),
                      ListAddButtonBuilder(
                        controller: controller.sensesController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PartOfSpeechSensesEditingController
    extends ValueNotifier<PartOfSpeechSenses?>
    with CommentableControllerMixin, IsVisibleControllerMixin {
  final sensesController = ListEditingController<Sense, SenseEditingController>(
    createItemController: SenseEditingController.new,
    maxLength: 30,
  );

  PartOfSpeechSensesEditingController() : super(null) {
    commentController.addListener(notifyListeners);
  }

  @override
  PartOfSpeechSenses? get value {
    final oldValue = super.value;

    if (oldValue == null) {
      // Cannot create because we have no PoS selector widget.
      // TODO: Allow creating new objects.
      // TODO: Create a selector widget for enums.
      return null;
    }

    return PartOfSpeechSenses(
      comment: commentController.text.trim(),
      isVisible: isVisible,
      partOfSpeech: oldValue.partOfSpeech, // TODO
      senses: sensesController.nonNullValues,
    );
  }

  @override
  set value(PartOfSpeechSenses? newValue) {
    commentController.text = newValue?.comment ?? '';
    isVisible = newValue?.isVisible ?? true;
    sensesController.value = newValue?.senses ?? [];
    super.value = newValue;
  }
}
