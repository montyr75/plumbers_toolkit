import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/offset_calculator_data.dart' as data;
import '../../app/repos/secure_storage/secure_storage_repo.dart';
import 'offset_calculator_state.dart';

part 'offset_calculator_ctrl.g.dart';

@riverpod
class OffsetCalculatorCtrl extends _$OffsetCalculatorCtrl {
  @override
  OffsetCalculatorState build() {
    _init();
    return const OffsetCalculatorState();
  }

  Future<void> _init() async {
    final json = await ref.read(secureStorageRepoProvider).read(StorageKey.offsetCalculatorState.toKey());

    if (json != null) {
      state = OffsetCalculatorState.fromJson(json).copyWith(offsetDistance: 0);
    }
  }

  void _saveState() {
    ref.read(secureStorageRepoProvider).write(key: StorageKey.offsetCalculatorState.toKey(), value: state.toJson());
  }

  void offsetDistanceChanged(double value) {
    state = state.copyWith(offsetDistance: value);
    _saveState();
  }

  void pipeTypeChanged(data.PipeType value) {
    state = state.copyWith(pipeType: value);

    _checkPipeSize();
    _saveState();
  }

  void pipeSizeChanged(double value) {
    state = state.copyWith(pipeSize: value);
    _saveState();
  }

  void offsetAngleChanged(double value) {
    state = state.copyWith(offsetAngle: value);
    _checkPipeSize();
    _saveState();
  }

  /// Not all pipe sizes are available in every configuration.
  void _checkPipeSize() {
    if (state.fittingAllowance == null) {
      state = state.copyWith(pipeSize: 3.0);
    }
  }
}
