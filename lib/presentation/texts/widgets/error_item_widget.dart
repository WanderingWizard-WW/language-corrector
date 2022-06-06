import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:language_corrector/core/theme/app_theme.dart';
import 'package:language_corrector/data/texts/models/text_errors_match_model.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';

class ErrorItemWidget extends StatefulWidget {
  const ErrorItemWidget({
    Key? key,
    required QuillController controller,
    required this.errorData,
  })  : _controller = controller,
        super(key: key);

  final TextErrorsMatch errorData;
  final QuillController _controller;

  @override
  State<ErrorItemWidget> createState() => _ErrorItemWidgetState();
}

class _ErrorItemWidgetState extends State<ErrorItemWidget> {
  bool isDetail = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 2,
        child: InkWell(
          onTap: () {
            setState(() {
              isDetail = !isDetail;
            });
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(width: 8),
                  if (!isDetail)
                    Row(
                      children: [
                        Text(
                          widget.errorData.context.text.substring(
                            widget.errorData.context.offset,
                            widget.errorData.context.offset +
                                widget.errorData.context.length,
                          ),
                          style: AppTheme.robotoRegular14,
                        ),
                        const SizedBox(width: 4),
                        const Text('—'),
                        const SizedBox(width: 4),
                        Text(
                          widget.errorData.rule.category.name,
                          style: AppTheme.robotoRegular12,
                        ),
                      ],
                    ),
                  if (isDetail)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.errorData.rule.category.name,
                              style: AppTheme.robotoSemiBold14,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.errorData.message,
                              style: AppTheme.robotoRegular12,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final replace
                                    in widget.errorData.replacements)
                                  ActionChip(
                                    label: Text(
                                      replace.value,
                                      style: AppTheme.robotoRegular12.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: AppTheme.skobeloffColor,
                                    onPressed: () {
                                      widget._controller.document.replace(
                                        widget.errorData.offset,
                                        widget.errorData.length,
                                        replace.value,
                                      );
                                      context
                                          .read<TextsCubit>()
                                          .resolveError(widget.errorData);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
