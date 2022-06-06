import 'package:language_corrector/core/utils/string_extension.dart';
import 'package:language_corrector/data/texts/models/text_errors_match_model.dart';

class TextsState {
  const TextsState({
    required this.errorsList,
  });

  final List<TextErrorsMatch> errorsList;
}
