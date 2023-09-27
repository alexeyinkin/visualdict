import 'package:common_dart/common_dart.dart';
import 'package:common_dart_backend/common_dart_backend.dart';
import 'package:get_it/get_it.dart';
import 'package:model_editors/model_editors.dart';

import '../services/country.dart';
import 'usage.dart';

class UsageListEditingController extends ListEditingController<
    Usage,
    UsageEditingController
//
    > {
  bool _isGenerating = false;
  String? _currentAction;

  UsageListEditingController()
      : super(
          createItemController: UsageEditingController.new,
          maxLength: 30,
        );

  bool get isGenerating => _isGenerating;

  String? get currentAction => _currentAction;

  Future<void> generate({
    required String word,
    required PartOfSpeechEnum pos,
    required String definition,
    required int count,
    String involving = '',
  }) async {
    if (_isGenerating) {
      return;
    }

    _isGenerating = true;
    _currentAction = getGenerateActionName(count);
    notifyListeners();

    try {
      await GetIt.instance.get<CountryService>().assertAllowed();
      final result = await ChatGpt4Service().getWordUsage(
        word,
        pos: pos,
        definition: definition,
        count: count,
        involving: involving,
      );

      for (final str in result) {
        final usage = Usage(
          comment: '',
          isVisible: true,
          text: str,
        );

        add(usage);
      }
    } finally {
      _isGenerating = false;
      _currentAction = null;
      notifyListeners();
    }
  }

  String getGenerateActionName(int count) => 'generate$count';
}
