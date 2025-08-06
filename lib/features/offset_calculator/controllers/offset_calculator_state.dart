import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/offset_calculator_data.dart' as data;
import '../../../utils/utils.dart';

part 'offset_calculator_state.mapper.dart';

@MappableClass()
class OffsetCalculatorState with OffsetCalculatorStateMappable {
  // user input
  final double offsetDistance; // center to center
  final data.PipeType pipeType; // PVC or ABS
  final double pipeSize; // diameter of pipe
  final double offsetAngle; // angle of offset

  const OffsetCalculatorState({
    this.offsetDistance = 0,
    this.pipeType = data.PipeType.pvc,
    this.pipeSize = 3.0,
    this.offsetAngle = 45.0,
  });

  double get cutLength {
    final offsetAngleData = data.offsetAngleData[offsetAngle]!;

    final diagonalLength = offsetDistance * offsetAngleData.multiplier;
    final fittingAllowance = offsetAngleData.fittingAllowance[pipeType]?[pipeSize];

    if (fittingAllowance == null) {
      return 0;
    }

    final cutLength = diagonalLength - (fittingAllowance * 2);

    return cutLength.minOf(data.minCutLength[pipeType]![pipeSize]! * 2);
  }

  double? get fittingAllowance => data.offsetAngleData[offsetAngle]?.fittingAllowance[pipeType]?[pipeSize];
  bool get hasValidFittingAllowance => fittingAllowance != null;

  static final fromMap = OffsetCalculatorStateMapper.fromMap;
  static final fromJson = OffsetCalculatorStateMapper.fromJson;
}
