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

    final roundedCutLength = state.roundedCutLength;
    final isValidCutLength = state.isValidCutLength(roundedCutLength);
    final minCutLength = state.minCutLength;

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
                  initialValue: state.pipeSize,
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
                  scrollPadding: const EdgeInsets.only(bottom: 150),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Cut Length',
                      textAlign: TextAlign.center,
                      style: styles.titleMedium,
                    ),
                    DefaultTextStyle(
                      style: styles.displaySmall.copyWith(color: isValidCutLength ? null : Colors.red),
                      child: MixedNumberDisplay(number: roundedCutLength),
                    ),
                    if (!isValidCutLength) ...[
                      boxS,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("min: "),
                          boxS,
                          MixedNumberDisplay(number: minCutLength),
                        ],
                      ),
                    ],
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

class MixedNumberDisplay extends StatelessWidget {
  final double number;

  const MixedNumberDisplay({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final numberSep = number.toMixedNumberSeparated();

    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(text: numberSep.$1),
          if (numberSep.$1.isNotEmpty && numberSep.$2.isNotEmpty) const TextSpan(text: ' '),
          TextSpan(
            text: numberSep.$2,
            style: const TextStyle(fontFeatures: [FontFeature.fractions()]),
          ),
          const TextSpan(text: '"'),
        ],
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
