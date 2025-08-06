import 'package:dart_mappable/dart_mappable.dart';

part 'offset_calculator_data.mapper.dart';

@MappableEnum()
enum PipeType {
  pvc,
  abs;

  @override
  String toString() => name.toUpperCase();
}

@MappableClass()
class OffsetAngleData with OffsetAngleDataMappable {
  final double angle;
  final double multiplier;
  final Map<PipeType, Map<double, double>> fittingAllowance;

  const OffsetAngleData({
    required this.angle,
    required this.multiplier,
    required this.fittingAllowance,
  });
}

final Map<double, OffsetAngleData> offsetAngleData = Map.unmodifiable({
  22.5: OffsetAngleData(
    angle: 22.5,
    multiplier: 2.613,
    fittingAllowance: Map.unmodifiable({
      PipeType.pvc: fittingAllowance225PVC,
      PipeType.abs: fittingAllowance225ABS,
    }),
  ),
  45.0: OffsetAngleData(
    angle: 45.0,
    multiplier: 1.414,
    fittingAllowance: Map.unmodifiable({
      PipeType.pvc: fittingAllowance45PVC,
      PipeType.abs: fittingAllowance45ABS,
    }),
  ),
  60.0: OffsetAngleData(
    angle: 60.0,
    multiplier: 1.155,
    fittingAllowance: Map.unmodifiable({
      PipeType.pvc: fittingAllowance60PVC,
      PipeType.abs: fittingAllowance60ABS,
    }),
  ),
});

final Map<PipeType, Map<double, double>> minCutLength = Map.unmodifiable({
  PipeType.pvc: minCutLengthPVC,
  PipeType.abs: minCutLengthABS,
});

// These tables are <pipeSize, fittingAllowance>
final Map<double, double> fittingAllowance45PVC = Map.unmodifiable({
  1.25: 1.0,
  1.5: 1.125,
  2.0: 1.5,
  3.0: 1.75,
  4.0: 2.1875,
  6.0: 2.0625,
  8.0: 2.0625,
  10.0: 3.125,
  12.0: 3.484375,
  14.0: 8.25,
  16.0: 10.3125,
});

final Map<double, double> fittingAllowance45ABS = Map.unmodifiable({
  2.0: 1.5,
  3.0: 1.75,
  4.0: 2.1875,
  6.0: 2.0625,
});

final Map<double, double> fittingAllowance225PVC = Map.unmodifiable({
  1.5: 0.5,
  2.0: 0.6875,
  3.0: 0.8125,
  4.0: 1.0,
  6.0: 1.5,
  8.0: 1.5,
  10.0: 2.0,
  12.0: 2.0,
  14.0: 5.25,
  16.0: 5.8125,
});

final Map<double, double> fittingAllowance225ABS = Map.unmodifiable({
  1.5: 0.5,
  2.0: 0.5,
  3.0: 0.8125,
  4.0: 1.0,
  6.0: 1.5,
});

final Map<double, double> fittingAllowance60PVC = Map.unmodifiable({
  1.5: 1.0,
  2.0: 1.3125,
  3.0: 1.6875,
  4.0: 2.0625,
});

final Map<double, double> fittingAllowance60ABS = Map.unmodifiable({
  1.5: 0.5,
  2.0: 1.25,
  3.0: 1.6875,
  4.0: 2.0,
});

// These tables are <pipeSize, minCutLength>
final Map<double, double> minCutLengthPVC = Map.unmodifiable({
  1.25: 0.687,
  1.5: 0.687,
  2.0: 0.75,
  3.0: 1.5,
  4.0: 1.75,
  6.0: 3.0,
  8.0: 4.0,
  10.0: 5.0,
  12.0: 6.0,
  14.0: 7.0,
  16.0: 8.0,
});

final Map<double, double> minCutLengthABS = Map.unmodifiable({
  1.5: 0.687,
  2.0: 0.75,
  3.0: 1.5,
  4.0: 1.75,
  6.0: 3.0,
});
