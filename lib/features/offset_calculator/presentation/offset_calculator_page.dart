import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/offset_calculator_data.dart';
import '../../../utils/screen_utils.dart';
import '../controllers/offset_calculator_ctrl.dart';

class OffsetCalculatorPage extends ConsumerWidget {
  const OffsetCalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offsetCalculatorCtrlProvider);

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
                      children: [
                        SegmentedButton<PipeType>(
                          showSelectedIcon: false,
                          segments: PipeType.values
                              .map((type) => ButtonSegment<PipeType>(label: Text(type.toString()), value: type))
                              .toList(),
                          selected: <PipeType>{state.pipeType},
                          onSelectionChanged: (value) =>
                              ref.read(offsetCalculatorCtrlProvider.notifier).pipeTypeChanged(value.first),
                        ),
                        boxXXL,
                        SegmentedButton<double>(
                          showSelectedIcon: false,
                          segments: offsetAngleData.keys
                              .map((angle) => ButtonSegment<double>(label: Text(angle.toDegreeDisplay()), value: angle))
                              .toList(),
                          selected: <double>{state.offsetAngle},
                          onSelectionChanged: (value) =>
                              ref.read(offsetCalculatorCtrlProvider.notifier).offsetAngleChanged(value.first),
                        ),
                        boxXXL,
                        DropdownButton<double>(
                          value: state.pipeSize,
                          underline: noWidget,
                          padding: const EdgeInsets.only(left: med),
                          onChanged: (value) => ref.read(offsetCalculatorCtrlProvider.notifier).pipeSizeChanged(value!),
                          items: offsetAngleData[state.offsetAngle]!.fittingAllowance[state.pipeType]!.keys
                              .map((size) => DropdownMenuItem<double>(value: size, child: Text(size.toInchesDisplay())))
                              .toList(),
                        ),
                      ],
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

extension DoubleFormatting on double {
  String toInchesDisplay() {
    if (truncate() == this) {
      return '${toInt()}"';
    }

    return '$this"';
  }

  String toDegreeDisplay() {
    if (truncate() == this) {
      return '${toInt()}°';
    }

    return '$this°';
  }
}
