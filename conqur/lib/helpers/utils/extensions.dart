import 'dart:async';

import 'package:logger/logger.dart';

extension StringUtils on String? {
  bool get isStrEmpty => this == null || this!.trim().length == 0;
}

Logger Log = Logger(printer: SimplePrinter());

extension SinkUtils<T> on StreamController<T?> {
  void addIfNotClosed(T? data) {
    if (!this.isClosed) {
      add(data);
    }
  }
}

enum CalibrationStatusType {
  notApplicable,
  calibrationSuccess,
  calibrationSkipped,
  calibrationRetrySuccess
}

extension ICalibrationStatusType on CalibrationStatusType {
  int getStatus() {
    switch (this) {
      case CalibrationStatusType.notApplicable:
        return 0;
      case CalibrationStatusType.calibrationSuccess:
        return 1;
      case CalibrationStatusType.calibrationRetrySuccess:
        return 2;
      case CalibrationStatusType.calibrationSkipped:
        return 3;
    }
  }

  String get value {
    switch (this) {
      case CalibrationStatusType.notApplicable:
        return "NOT_APPLICABLE";
      case CalibrationStatusType.calibrationSuccess:
        return "CALIBRATION_APPLICABLE";
      case CalibrationStatusType.calibrationRetrySuccess:
        return "CALIBRATION_COMPLETED_SECOND_ATTEMPT";
      case CalibrationStatusType.calibrationSkipped:
        return "CALIBRATION_WAS_SKIPPED";
    }
  }
}
