import 'dart:typed_data';

class DecodeUtils {

  static int heartRate = 0;
  static int readLoopCount = 0;

  static bool isCommand(String hex) {
    return !((hex.length == 80) || (hex.length == 72)) && hex.length > 0;
  }

  static bool isMemoryData(String hex) {
    return hex.length == 80;
  }

  static bool isEcgStream(String hex) {
    return hex.length == 72;
  }

  static String bytesToHex(List<int> intData) {
    String hexData = '';
    intData.forEach((element) {
      hexData += element.toRadixString(16).padLeft(2, '0').toUpperCase();
    });
    return hexData;
  }

  static String decodeEcgStream(String hex, List<int> data) {
    String retString = '';

    heartRate = int.parse(hex.substring(70, 72), radix: 16);

    Int16List bytes = data as Int16List;

    var blob = ByteData.sublistView(bytes, 3, 34);

    for (int i = 0; i < 32; i++) {
      int ecgVal = blob.getInt16(i++, Endian.big);
      retString += '$ecgVal\n';
    }
    return retString.toString();
  }


}
