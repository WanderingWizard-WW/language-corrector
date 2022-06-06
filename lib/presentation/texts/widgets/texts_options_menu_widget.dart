import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_corrector/core/di/injector.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class TextsOptionsMenuWidget extends StatelessWidget {
  const TextsOptionsMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (context) => locator<TextsCubit>(),
      child: PopupMenuButton<Menu>(
        icon: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
          PopupMenuItem<Menu>(
            value: Menu.itemOne,
            child: const Text('Очистить текст'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
