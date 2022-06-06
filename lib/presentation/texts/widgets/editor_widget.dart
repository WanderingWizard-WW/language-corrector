import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_state.dart';
import 'package:language_corrector/presentation/texts/widgets/editor_tool_bar_widget.dart';

class EditorWidget extends StatelessWidget {
  const EditorWidget({Key? key, required QuillController controller})
      : _controller = controller,
        super(key: key);

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BlocBuilder<TextsCubit, TextsState>(

          builder: (context, state) {
            for (final element in state.errorsList) {
              _controller.document.format(
                element.offset,
                element.length,
                ColorAttribute('red'),
              );
              _controller.document.format(
                element.offset,
                element.length,
                Attribute.bold,
              );
            }

            return Expanded(
              child: QuillEditor(
                controller: _controller,
                scrollController: ScrollController(),
                scrollable: true,
                autoFocus: false,
                readOnly: false,
                placeholder: 'Введіть або вставте текст сюди',
                expands: false,
                padding: const EdgeInsets.only(
                  top: 56,
                  bottom: 40,
                  left: 40,
                  right: 40,
                ),
                scrollBottomInset: 150,
                focusNode: FocusNode(),
              ),
            );
          },
        ),
        EditorToolBarWidget(controller: _controller),
      ],
    );
  }
}
