import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:language_corrector/data/texts/models/text_errors_match_model.dart';
import 'package:language_corrector/presentation/texts/widgets/error_item_widget.dart';

class ErrorsListWidget extends StatelessWidget {
  const ErrorsListWidget({
    Key? key,
    required QuillController controller,
    required this.errorsList,
  })  : _controller = controller,
        super(key: key);

  final QuillController _controller;

  final List<TextErrorsMatch> errorsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: errorsList.length,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      itemBuilder: (context, index) {
        return ErrorItemWidget(
          errorData: errorsList[index],
          controller: _controller,
        );
      },
    );
  }
}
