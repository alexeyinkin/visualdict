import 'package:common_dart/common_dart.dart';
import 'package:model_editors/model_editors.dart';

import 'part_of_speech_senses.dart';

class PartOfSpeechSensesListEditingController extends ListEditingController<
    PartOfSpeechSenses, PartOfSpeechSensesEditingController> {
  PartOfSpeechSensesListEditingController()
      : super(
          createItemController: PartOfSpeechSensesEditingController.new,
          minLength: 1,
          maxLength: 10000,
        );

  @override
  bool get canAdd {
    return _getNextPartOfSpeech() != null;
  }

  PartOfSpeechEnum? _getNextPartOfSpeech() {
    final existing = {...nonNullValues.map((v) => v.partOfSpeech)};
    for (final pos in PartOfSpeechEnum.values) {
      if (!existing.contains(pos)) {
        return pos;
      }
    }

    return null;
  }

  void addNextPartOfSpeech() {
    final pos = _getNextPartOfSpeech() ??
        (throw Exception('All parts of speech are already created'));

    add(
      PartOfSpeechSenses(
        comment: '',
        isVisible: true,
        partOfSpeech: pos,
        senses: const [
          Sense(
            comment: '',
            complexDefinition: '',
            definition: '',
            definitionTranslations: {},
            isVisible: true,
            usages: [],
          ),
        ],
      ),
    );
  }
}
