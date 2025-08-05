import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/offset_calculator_data.dart' as data;
import '../../../utils/utils.dart';
import 'offset_calculator_state.dart';

part 'offset_calculator_ctrl.g.dart';

@riverpod
class OffsetCalculatorCtrl extends _$OffsetCalculatorCtrl {
  @override
  OffsetCalculatorState build() {
    return const OffsetCalculatorState();
  }

  void offsetDistanceChanged(double value) {
    state = state.copyWith(offsetDistance: value);
    _calculate();
  }

  void pipeTypeChanged(data.PipeType value) {
    state = state.copyWith(pipeType: value);
    _calculate();
  }

  void pipeSizeChanged(double value) {
    state = state.copyWith(pipeSize: value);
    _calculate();
  }

  void offsetAngleChanged(double value) {
    state = state.copyWith(offsetAngle: value);
    _calculate();
  }

  void _calculate() {
    final offsetAngleData = data.offsetAngleData[state.offsetAngle]!;

    final diagonalLength = state.offsetDistance * offsetAngleData.multiplier;
    final cutLength = diagonalLength - (offsetAngleData.fittingAllowance[state.pipeType]![state.pipeSize]! * 2);

    state = state.copyWith(
      diagonalLength: diagonalLength,
      cutLength: cutLength.minOf(data.minCutLength[state.pipeType]![state.pipeSize]! * 2),
    );
  }
}