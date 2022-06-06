import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:language_corrector/core/theme/app_theme.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_state.dart';
import 'package:language_corrector/presentation/texts/widgets/empty_errors_widget.dart';
import 'package:language_corrector/presentation/texts/widgets/errors_count_widget.dart';
import 'package:language_corrector/presentation/texts/widgets/errors_list_widget.dart';

class RightTextsPageBarWidget extends StatelessWidget {
  const RightTextsPageBarWidget({Key? key, required QuillController controller})
      : _controller = controller,
        super(key: key);

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      color: AppTheme.ghostWhiteColor,
      child: BlocBuilder<TextsCubit, TextsState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.errorsList.isNotEmpty)
                ErrorsCountWidget(errors: state.errorsList.length),
              const SizedBox(height: 16),
              if (state.errorsList.isNotEmpty)
                Expanded(
                  child: ErrorsListWidget(
                    errorsList: state.errorsList,
                    controller: _controller,
                  ),
                ),
              if (state.errorsList.isEmpty) const Spacer(),
              if (state.errorsList.isEmpty) const EmptyErrorsWidget(),
              if (state.errorsList.isEmpty) const Spacer(),
              const Divider(),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final text = _controller.document.toPlainText();
                    context.read<TextsCubit>().checkTextOnErrors(text);
                  },
                  child: Text(
                    'Перевірити текст',
                    style: AppTheme.robotoSemiBold14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
