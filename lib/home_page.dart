import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Here is a AppBar'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showAboutDialog(context: context);
                  },
                  child: const Text('About Dialog'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                  },
                  child: const Text('Date Picker Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                  child: const Text('Time Picker Dialog'),
                ),
              ],
            ),
            Card(
              color: Theme.of(context).primaryColor,
              borderOnForeground: true,
              shadowColor: Theme.of(context).cardTheme.shadowColor,
              child: const SizedBox(
                height: 150,
                width: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Snackbar'),
                      backgroundColor: Theme.of(context).primaryColor,
                      action: SnackBarAction(
                        label: 'Action',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('SnackBar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final materialBanner = MaterialBanner(
                      content: const Text(' Material Banner'),
                      backgroundColor: Theme.of(context).primaryColor,
                      leading: const Icon(Icons.info),
                      actions: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Some Action')),
                        ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentMaterialBanner();
                            },
                            child: const Text('Dismiss')),
                      ],
                    );
                    ScaffoldMessenger.of(context)
                        .showMaterialBanner(materialBanner);
                  },
                  child: const Text('MaterialBanner'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {},
                ),
                Radio<bool>(
                  value: true,
                  groupValue: true,
                  onChanged: (bool? value) {},
                ),
                Switch(
                  value: true,
                  onChanged: (bool value) {},
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: theme.switchTheme),
    );
  }
}
