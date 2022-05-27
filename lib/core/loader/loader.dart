import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  static bool _isShown = false;

  static final _entry = OverlayEntry(builder: (context) => const Loader());

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 240),
            child: const CircularProgressIndicator(color: Colors.amberAccent),
          ),
        ),
      ),
    );
  }
}

Future<void> _ensureVisible() async {
  await Future.delayed(const Duration(milliseconds: 300));
}

Future<void> showLoader(OverlayState? overlay) async {
  if (Loader._isShown) return;
  overlay?.insert(Loader._entry);
  Loader._isShown = true;
  await _ensureVisible();
}

void dismissLoader() {
  if (!Loader._isShown) return;
  Loader._entry.remove();
  Loader._isShown = false;
}
