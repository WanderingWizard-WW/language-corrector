import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:language_corrector/core/di/injector.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';
import 'package:language_corrector/presentation/texts/widgets/editor_widget.dart';
import 'package:language_corrector/presentation/texts/widgets/right_texts_page_bar_widget.dart';

class TextsPage extends StatefulWidget {
  const TextsPage({Key? key}) : super(key: key);

  @override
  State<TextsPage> createState() => _TextsPageState();
}

class _TextsPageState extends State<TextsPage> {
  final _controller = locator<QuillController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TextsCubit>(),
      child: Scaffold(
        body: Row(
          children: [
            Expanded(child: EditorWidget(controller: _controller)),
            Container(height: double.infinity, color: Colors.black26, width: 1),
            RightTextsPageBarWidget(controller: _controller),
          ],
        ),
      ),
    );
  }
}
