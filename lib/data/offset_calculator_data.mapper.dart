// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'offset_calculator_data.dart';

class PipeTypeMapper extends EnumMapper<PipeType> {
  PipeTypeMapper._();

  static PipeTypeMapper? _instance;
  static PipeTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PipeTypeMapper._());
    }
    return _instance!;
  }

  static PipeType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PipeType decode(dynamic value) {
    switch (value) {
      case r'pvc':
        return PipeType.pvc;
      case r'abs':
        return PipeType.abs;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PipeType self) {
    switch (self) {
      case PipeType.pvc:
        return r'pvc';
      case PipeType.abs:
        return r'abs';
    }
  }
}

extension PipeTypeMapperExtension on PipeType {
  String toValue() {
    PipeTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PipeType>(this) as String;
  }
}

class OffsetAngleDataMapper extends ClassMapperBase<OffsetAngleData> {
  OffsetAngleDataMapper._();

  static OffsetAngleDataMapper? _instance;
  static OffsetAngleDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OffsetAngleDataMapper._());
      PipeTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OffsetAngleData';

  static double _$angle(OffsetAngleData v) => v.angle;
  static const Field<OffsetAngleData, double> _f$angle =
      Field('angle', _$angle);
  static double _$multiplier(OffsetAngleData v) => v.multiplier;
  static const Field<OffsetAngleData, double> _f$multiplier =
      Field('multiplier', _$multiplier);
  static Map<PipeType, Map<double, double>> _$fittingAllowance(
          OffsetAngleData v) =>
      v.fittingAllowance;
  static const Field<OffsetAngleData, Map<PipeType, Map<double, double>>>
      _f$fittingAllowance = Field('fittingAllowance', _$fittingAllowance);

  @override
  final MappableFields<OffsetAngleData> fields = const {
    #angle: _f$angle,
    #multiplier: _f$multiplier,
    #fittingAllowance: _f$fittingAllowance,
  };

  static OffsetAngleData _instantiate(DecodingData data) {
    return OffsetAngleData(
        angle: data.dec(_f$angle),
        multiplier: data.dec(_f$multiplier),
        fittingAllowance: data.dec(_f$fittingAllowance));
  }

  @override
  final Function instantiate = _instantiate;

  static OffsetAngleData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OffsetAngleData>(map);
  }

  static OffsetAngleData fromJson(String json) {
    return ensureInitialized().decodeJson<OffsetAngleData>(json);
  }
}

mixin OffsetAngleDataMappable {
  String toJson() {
    return OffsetAngleDataMapper.ensureInitialized()
        .encodeJson<OffsetAngleData>(this as OffsetAngleData);
  }

  Map<String, dynamic> toMap() {
    return OffsetAngleDataMapper.ensureInitialized()
        .encodeMap<OffsetAngleData>(this as OffsetAngleData);
  }

  OffsetAngleDataCopyWith<OffsetAngleData, OffsetAngleData, OffsetAngleData>
      get copyWith =>
          _OffsetAngleDataCopyWithImpl<OffsetAngleData, OffsetAngleData>(
              this as OffsetAngleData, $identity, $identity);
  @override
  String toString() {
    return OffsetAngleDataMapper.ensureInitialized()
        .stringifyValue(this as OffsetAngleData);
  }

  @override
  bool operator ==(Object other) {
    return OffsetAngleDataMapper.ensureInitialized()
        .equalsValue(this as OffsetAngleData, other);
  }

  @override
  int get hashCode {
    return OffsetAngleDataMapper.ensureInitialized()
        .hashValue(this as OffsetAngleData);
  }
}

extension OffsetAngleDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OffsetAngleData, $Out> {
  OffsetAngleDataCopyWith<$R, OffsetAngleData, $Out> get $asOffsetAngleData =>
      $base.as((v, t, t2) => _OffsetAngleDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OffsetAngleDataCopyWith<$R, $In extends OffsetAngleData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, PipeType, Map<double, double>,
          ObjectCopyWith<$R, Map<double, double>, Map<double, double>>>
      get fittingAllowance;
  $R call(
      {double? angle,
      double? multiplier,
      Map<PipeType, Map<double, double>>? fittingAllowance});
  OffsetAngleDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OffsetAngleDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OffsetAngleData, $Out>
    implements OffsetAngleDataCopyWith<$R, OffsetAngleData, $Out> {
  _OffsetAngleDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OffsetAngleData> $mapper =
      OffsetAngleDataMapper.ensureInitialized();
  @override
  MapCopyWith<$R, PipeType, Map<double, double>,
          ObjectCopyWith<$R, Map<double, double>, Map<double, double>>>
      get fittingAllowance => MapCopyWith(
          $value.fittingAllowance,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fittingAllowance: v));
  @override
  $R call(
          {double? angle,
          double? multiplier,
          Map<PipeType, Map<double, double>>? fittingAllowance}) =>
      $apply(FieldCopyWithData({
        if (angle != null) #angle: angle,
        if (multiplier != null) #multiplier: multiplier,
        if (fittingAllowance != null) #fittingAllowance: fittingAllowance
      }));
  @override
  OffsetAngleData $make(CopyWithData data) => OffsetAngleData(
      angle: data.get(#angle, or: $value.angle),
      multiplier: data.get(#multiplier, or: $value.multiplier),
      fittingAllowance:
          data.get(#fittingAllowance, or: $value.fittingAllowance));

  @override
  OffsetAngleDataCopyWith<$R2, OffsetAngleData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OffsetAngleDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
