import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/offset_calculator_data.dart';

part 'offset_calculator_state.mapper.dart';

@MappableClass()
class OffsetCalculatorState with OffsetCalculatorStateMappable {
  // user input
  final double offsetDistance;    // center to center
  final PipeType pipeType;        // PVC or ABS
  final double pipeSize;          // diameter of pipe
  final double offsetAngle;       // angle of offset

  final double diagonalLength;    // offsetDistance x multiplier
  final double cutLength;         // diagonalLength - (fittingAllowance * 2)

  const OffsetCalculatorState({
    this.offsetDistance = 0,
    this.pipeType = PipeType.pvc,
    this.pipeSize = 3.0,
    this.offsetAngle = 45.0,
    this.diagonalLength = 0,
    this.cutLength = 0,
  });
}