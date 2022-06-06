import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class EditorToolBarWidget extends StatelessWidget {
  const EditorToolBarWidget({Key? key, required QuillController controller})
      : _controller = controller,
        super(key: key);

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 16),
      child: QuillToolbar.basic(
        iconTheme: const QuillIconTheme(
          iconSelectedFillColor: AppTheme.skobeloffColor,
        ),
        showFontSize: false,
        showLink: false,
        showImageButton: false,
        showCameraButton: false,
        showCodeBlock: false,
        showVideoButton: false,
        showListNumbers: false,
        showInlineCode: false,
        showListCheck: false,
        showQuote: false,
        showIndent: false,
        showListBullets: false,
        controller: _controller,
      ),
    );
  }
}
