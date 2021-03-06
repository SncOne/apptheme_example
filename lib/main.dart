import 'package:apptheme_example/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: const HomePage(),
      );
    });
  }
}
