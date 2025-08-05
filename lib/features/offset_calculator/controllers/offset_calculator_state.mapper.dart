// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'offset_calculator_state.dart';

class OffsetCalculatorStateMapper
    extends ClassMapperBase<OffsetCalculatorState> {
  OffsetCalculatorStateMapper._();

  static OffsetCalculatorStateMapper? _instance;
  static OffsetCalculatorStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OffsetCalculatorStateMapper._());
      PipeTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OffsetCalculatorState';

  static double _$offsetDistance(OffsetCalculatorState v) => v.offsetDistance;
  static const Field<OffsetCalculatorState, double> _f$offsetDistance =
      Field('offsetDistance', _$offsetDistance, opt: true, def: 0);
  static PipeType _$pipeType(OffsetCalculatorState v) => v.pipeType;
  static const Field<OffsetCalculatorState, PipeType> _f$pipeType =
      Field('pipeType', _$pipeType, opt: true, def: PipeType.pvc);
  static double _$pipeSize(OffsetCalculatorState v) => v.pipeSize;
  static const Field<OffsetCalculatorState, double> _f$pipeSize =
      Field('pipeSize', _$pipeSize, opt: true, def: 0);
  static double _$offsetAngle(OffsetCalculatorState v) => v.offsetAngle;
  static const Field<OffsetCalculatorState, double> _f$offsetAngle =
      Field('offsetAngle', _$offsetAngle, opt: true, def: 0);
  static double _$diagonalLength(OffsetCalculatorState v) => v.diagonalLength;
  static const Field<OffsetCalculatorState, double> _f$diagonalLength =
      Field('diagonalLength', _$diagonalLength, opt: true, def: 0);
  static double _$cutLength(OffsetCalculatorState v) => v.cutLength;
  static const Field<OffsetCalculatorState, double> _f$cutLength =
      Field('cutLength', _$cutLength, opt: true, def: 0);

  @override
  final MappableFields<OffsetCalculatorState> fields = const {
    #offsetDistance: _f$offsetDistance,
    #pipeType: _f$pipeType,
    #pipeSize: _f$pipeSize,
    #offsetAngle: _f$offsetAngle,
    #diagonalLength: _f$diagonalLength,
    #cutLength: _f$cutLength,
  };

  static OffsetCalculatorState _instantiate(DecodingData data) {
    return OffsetCalculatorState(
        offsetDistance: data.dec(_f$offsetDistance),
        pipeType: data.dec(_f$pipeType),
        pipeSize: data.dec(_f$pipeSize),
        offsetAngle: data.dec(_f$offsetAngle),
        diagonalLength: data.dec(_f$diagonalLength),
        cutLength: data.dec(_f$cutLength));
  }

  @override
  final Function instantiate = _instantiate;

  static OffsetCalculatorState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OffsetCalculatorState>(map);
  }

  static OffsetCalculatorState fromJson(String json) {
    return ensureInitialized().decodeJson<OffsetCalculatorState>(json);
  }
}

mixin OffsetCalculatorStateMappable {
  String toJson() {
    return OffsetCalculatorStateMapper.ensureInitialized()
        .encodeJson<OffsetCalculatorState>(this as OffsetCalculatorState);
  }

  Map<String, dynamic> toMap() {
    return OffsetCalculatorStateMapper.ensureInitialized()
        .encodeMap<OffsetCalculatorState>(this as OffsetCalculatorState);
  }

  OffsetCalculatorStateCopyWith<OffsetCalculatorState, OffsetCalculatorState,
      OffsetCalculatorState> get copyWith => _OffsetCalculatorStateCopyWithImpl<
          OffsetCalculatorState, OffsetCalculatorState>(
      this as OffsetCalculatorState, $identity, $identity);
  @override
  String toString() {
    return OffsetCalculatorStateMapper.ensureInitialized()
        .stringifyValue(this as OffsetCalculatorState);
  }

  @override
  bool operator ==(Object other) {
    return OffsetCalculatorStateMapper.ensureInitialized()
        .equalsValue(this as OffsetCalculatorState, other);
  }

  @override
  int get hashCode {
    return OffsetCalculatorStateMapper.ensureInitialized()
        .hashValue(this as OffsetCalculatorState);
  }
}

extension OffsetCalculatorStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OffsetCalculatorState, $Out> {
  OffsetCalculatorStateCopyWith<$R, OffsetCalculatorState, $Out>
      get $asOffsetCalculatorState => $base.as(
          (v, t, t2) => _OffsetCalculatorStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OffsetCalculatorStateCopyWith<
    $R,
    $In extends OffsetCalculatorState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {double? offsetDistance,
      PipeType? pipeType,
      double? pipeSize,
      double? offsetAngle,
      double? diagonalLength,
      double? cutLength});
  OffsetCalculatorStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OffsetCalculatorStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OffsetCalculatorState, $Out>
    implements OffsetCalculatorStateCopyWith<$R, OffsetCalculatorState, $Out> {
  _OffsetCalculatorStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OffsetCalculatorState> $mapper =
      OffsetCalculatorStateMapper.ensureInitialized();
  @override
  $R call(
          {double? offsetDistance,
          PipeType? pipeType,
          double? pipeSize,
          double? offsetAngle,
          double? diagonalLength,
          double? cutLength}) =>
      $apply(FieldCopyWithData({
        if (offsetDistance != null) #offsetDistance: offsetDistance,
        if (pipeType != null) #pipeType: pipeType,
        if (pipeSize != null) #pipeSize: pipeSize,
        if (offsetAngle != null) #offsetAngle: offsetAngle,
        if (diagonalLength != null) #diagonalLength: diagonalLength,
        if (cutLength != null) #cutLength: cutLength
      }));
  @override
  OffsetCalculatorState $make(CopyWithData data) => OffsetCalculatorState(
      offsetDistance: data.get(#offsetDistance, or: $value.offsetDistance),
      pipeType: data.get(#pipeType, or: $value.pipeType),
      pipeSize: data.get(#pipeSize, or: $value.pipeSize),
      offsetAngle: data.get(#offsetAngle, or: $value.offsetAngle),
      diagonalLength: data.get(#diagonalLength, or: $value.diagonalLength),
      cutLength: data.get(#cutLength, or: $value.cutLength));

  @override
  OffsetCalculatorStateCopyWith<$R2, OffsetCalculatorState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OffsetCalculatorStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
