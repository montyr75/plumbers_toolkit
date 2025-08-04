enum PipeType {
  pvc,
  abs,
}

class OffsetAngleData {
  final double angle;
  final double multiplier;

  const OffsetAngleData({
    required this.angle,
    required this.multiplier,
  });
}

const Map<double, double> makeUp45 = {
  
};