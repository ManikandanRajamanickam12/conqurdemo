import 'package:flutter/material.dart';

import 'dart:typed_data';


class ECGStream with ChangeNotifier {

  List<int> _list = [];
  int _heartRate = 0;
  String _string = '';
  bool _visible = false;

  getArray() => _list;
  getHeartRate() => _heartRate;
  getString() => _string;
  getVisibility() => _visible;

  setVisibility(bool flag) => _visible = flag;

  void decode(String hex, List<int> data) {

    _string = '';

    _heartRate = int.parse(hex.substring(70, 72), radix: 16);

    Int16List bytes = data as Int16List;

    var blob = ByteData.sublistView(bytes, 3, 34);

    for (int i = 0; i < 32; i++) {
      int ecgVal = blob.getInt16(i++, Endian.big);
      _string += '$ecgVal\n';
    }
    notifyListeners();
  }
}

