import 'package:flutter/material.dart';

import '../../../utils/screen_utils.dart';

class OffsetCalculatorPage extends StatelessWidget {
  const OffsetCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offset Calculator")),
      body: Padding(
        padding: paddingAllM,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
