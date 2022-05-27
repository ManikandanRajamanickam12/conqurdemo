import 'package:flutter/material.dart';

class Console with ChangeNotifier {
  String _string = '';
  int _batLvl = 0;
  int _pendingCount = 0;
  String get string => _string;
  int get batLvl =>_batLvl;
  int get pendingCount => _pendingCount;
  setString(String string) => _string = string;

  void decode(String hex) {
    String command = hex.substring(0, 2);
    _string = '';

    switch (command) {
      case '31':
        _string += '--- STATUS ---\n';
        String acqStatus = ((int.parse(hex.substring(2, 4), radix: 16) == 0)
            ? "IDLE"
            : "RUNNING");
         _batLvl = int.parse(hex.substring(4, 6), radix: 16);
        int currWrite = int.parse(hex.substring(6, 14), radix: 16);
        int currRead = int.parse(hex.substring(14, 22), radix: 16);
        int amplitude = int.parse(hex.substring(22, 26), radix: 16);
        int timestamp = int.parse(hex.substring(28, 36), radix: 16);
        _pendingCount = ((currWrite - currRead) ~/ 40);
        _string +=
        """
          Battery: $batLvl% || Status: $acqStatus
          ECG amp: $amplitude || TICKS: $timestamp
          ADDR WRITE: $currWrite
          ADDR  READ: $currRead || Pending: $pendingCount""";
        break;
      case '32':
        _string += ("ACQUISITION START -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00'
            ? 'SUCCESS'
            : errCode == 'FE'
            ? 'INVALID'
            : 'ERROR';
        break;
      case '33':
        _string += ("ACQUISITION STOP -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00'
            ? 'SUCCESS'
            : errCode == 'FE'
            ? 'INVALID'
            : 'ERROR';
        break;
      case '30':
        _string += ("NEW SESSION -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00'
            ? 'SUCCESS'
            : errCode == 'FE'
            ? 'INVALID'
            : 'ERROR';
        break;
      case '37':
        _string += ("ECG START -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00'
            ? 'SUCCESS'
            : errCode == 'FE'
            ? 'INVALID'
            : 'ERROR';

        break;
      case '38':
        _string += ("ECG STOP -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00' ? 'SUCCESS' : 'ERROR';

        break;
      case '62':
        _string += ("BEATCHECK START -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00' ? 'SUCCESS' : 'ERROR';

        break;
      case '42':
        _string += ("BEATCHECK STOP -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00' ? 'SUCCESS' : 'ERROR';

        break;
      case '35':
        _string += ("READ -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == 'F0' ? 'EMPTY' : 'ERROR';

        break;
      case '36':
        _string += ("READ STOP -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00' ? 'SUCCESS' : 'ERROR';

        break;
      case '69':
        _string += ("--- DEVICE INFO ---");
        int verA = int.parse(hex.substring(2, 4), radix: 16);
        int verB = int.parse(hex.substring(4, 6), radix: 16);
        int verC = int.parse(hex.substring(6, 8), radix: 16);
        _string += '\nFirmware version: $verA.$verB.$verC';
        break;
      case '43':
        _string += ("ACC CALIBRATE -> ");
        String errCode = hex.substring(2, 4);
        _string += errCode == '00' ? 'SUCCESS' : 'ERROR';

        break;
    }
    notifyListeners();
  }
}

