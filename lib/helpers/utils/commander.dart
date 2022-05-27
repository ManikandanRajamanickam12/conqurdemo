import 'dart:convert';

import 'package:flutter_blue/flutter_blue.dart';

enum BleCommand {
  initialize,
  deviceStatus,
  startSession,
  stopSession,
  readPacket,
  stopReadPacket,
  ecgStartStreaming,
  ecgStopStreaming,
  deviceInfo,
  beatCheckEnable,
  beatCheckDisable,
  accStart,
  dashInfo
}

extension IBleCommand on BleCommand {
  String get command {
    switch (this) {
      case BleCommand.initialize:
        return "0";
      case BleCommand.deviceStatus:
        return "1";
      case BleCommand.startSession:
        return "2";
      case BleCommand.stopSession:
        return "3";
      case BleCommand.readPacket:
        return "5";
      case BleCommand.stopReadPacket:
        return "6";
      case BleCommand.ecgStartStreaming:
        return "7";
      case BleCommand.ecgStopStreaming:
        return "8";
      case BleCommand.deviceInfo:
        return "i";
      case BleCommand.beatCheckEnable:
        return "b";
      case BleCommand.beatCheckDisable:
        return "B";
      case BleCommand.accStart:
        return "C";
      case BleCommand.dashInfo:
        return "d";
      default:
        return "1";
    }
  }

  void sendCommand(BluetoothCharacteristic? rxChar) {
    if (rxChar != null) rxChar.write(utf8.encode(this.command));
  }
}
