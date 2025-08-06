import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/offset_calculator_data.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../controllers/offset_calculator_ctrl.dart';

class OffsetCalculatorPage extends ConsumerStatefulWidget {
  const OffsetCalculatorPage({super.key});

  @override
  ConsumerState<OffsetCalculatorPage> createState() => _OffsetCalculatorPageState();
}

class _OffsetCalculatorPageState extends ConsumerState<OffsetCalculatorPage> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _textController.selectAll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(offsetCalculatorCtrlProvider);
    final styles = context.textStyles;

    final cutLength = state.cutLength.roundToNearestFraction(8).toMixedNumberSeparated();

    return Scaffold(
      appBar: AppBar(title: const Text("Offset Calculator")),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: SingleChildScrollView(
            padding: paddingAllM,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                DropdownButtonFormField<double>(
                  value: state.pipeSize,
                  decoration: const InputDecoration(
                    labelText: 'Pipe Size',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ref.read(offsetCalculatorCtrlProvider.notifier).pipeSizeChanged(value!);
                  },
                  items: offsetAngleData[state.offsetAngle]!.fittingAllowance[state.pipeType]!.keys
                      .map(
                        (size) => DropdownMenuItem<double>(
                          value: size,
                          child: Text(size.toInchesDisplay()),
                        ),
                      )
                      .toList(),
                ),
                boxXXL,
                TextFormField(
                  autofocus: true,
                  controller: _textController,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Offset Distance',
                    suffixText: 'in.',
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    final distance = double.tryParse(value) ?? 0.0;
                    ref.read(offsetCalculatorCtrlProvider.notifier).offsetDistanceChanged(distance);
                  },
                ),
                boxXXL,
                if (state.cutLength > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Cut Length',
                        textAlign: TextAlign.center,
                        style: styles.titleMedium,
                      ),
                      Text.rich(
                        style: styles.displaySmall,
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(text: cutLength.$1),
                            if (cutLength.$1.isNotEmpty && cutLength.$2.isNotEmpty) const TextSpan(text: ' '),
                            TextSpan(
                              text: cutLength.$2,
                              style: const TextStyle(fontFeatures: [FontFeature.fractions()]),
                            ),
                            const TextSpan(text: '"'),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
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
