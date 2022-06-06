import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:language_corrector/data/texts/models/api_response_model.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_state.dart';

import '../../../data/texts/models/text_errors_match_model.dart';

class TextsCubit extends Cubit<TextsState> {
  TextsCubit({
    required this.dio,
    required this.quillController,
  }) : super(const TextsState(errorsList: []));
  final QuillController quillController;
  final Dio dio;

  Future<void> checkTextOnErrors(String text) async {
    final response = await dio.post(
      '/check',
      data: {
        'text': text,
        'language': 'uk-UA',
      },
    );
    final model = ApiResponse.fromJson(response.data);
    emit(TextsState(errorsList: List.from(model.matches)));
  }

  void resolveError(TextErrorsMatch error) {
    emit(TextsState(errorsList: List.from(state.errorsList..remove(error))));

    final text = quillController.document.toPlainText();
    quillController.clear();
    quillController.document.insert(0, text);
    checkTextOnErrors(text);
  }
}
