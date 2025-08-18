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

  double get cutLength => travel - ((fittingAllowance ?? 0) * 2);

  double? get multiplier => data.offsetAngleData[offsetAngle]?.multiplier;

  // sometimes called diagonal length
  double get travel => offsetDistance * (multiplier ?? 0);

  double? get fittingAllowance => data.offsetAngleData[offsetAngle]?.fittingAllowance[pipeType]?[pipeSize];
  bool get hasValidFittingAllowance => fittingAllowance != null;

  double get roundedCutLength => cutLength.roundToNearestFraction(8);

  double get minCutLength => (data.minCutLength[pipeType]?[pipeSize] ?? 0) * 2;
  bool isValidCutLength([double? cutLength]) => (cutLength ?? this.cutLength) > minCutLength;

  static final fromMap = OffsetCalculatorStateMapper.fromMap;
  static final fromJson = OffsetCalculatorStateMapper.fromJson;
}
