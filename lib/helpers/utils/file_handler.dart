import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FileHandler {
  String formattedDate = '';
  bool isWriteEnabled = false;
  bool isStreamEnabled = false;

  void enableLogging() async {

    if (await Permission.storage.status.isDenied)
      await Permission.storage.request();

    if (await Permission.storage.request().isGranted) {
      isWriteEnabled = true;

      DateTime now = DateTime.now();
      formattedDate = DateFormat('yyyy-MM-dd_kk-mm').format(now);

      Fluttertoast.showToast(msg: "Logging enabled");
    } else
      Fluttertoast.showToast(msg: "Error enabling logging");
  }

  void enableStreaming() async {

    if (await Permission.storage.status.isDenied)
      await Permission.storage.request();

    if (await Permission.storage.request().isGranted) {
      isStreamEnabled = true;

      DateTime now = DateTime.now();
      formattedDate = DateFormat('yyyy-MM-dd_kk-mm').format(now);

      Fluttertoast.showToast(msg: "Streaming enabled");
    } else
      Fluttertoast.showToast(msg: "Error enabling streaming");
  }

  void disableLogging() {
    isWriteEnabled = false;
    Fluttertoast.showToast(msg: "Logging disabled");
  }

  void disableStreaming() {
    isStreamEnabled = false;
    Fluttertoast.showToast(msg: "Streaming disabled");
  }

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  Future<File> get _rawFile async {
    final path = await _localPath;
    print(path.toString());
    return File('$path/${formattedDate}_RAW.txt');
  }

  Future<File> get _streamFile async {
    final path = await _localPath;
    print(path.toString());
    return File('$path/${formattedDate}_ECG.txt');
  }

  Future<File> writeRawData(String data) async {
    final rawFile = await _rawFile;
    return rawFile.writeAsString('$data', mode: FileMode.append);
  }

  Future<File> writeStreamData(String data) async {
    final streamFile = await _streamFile;
    return streamFile.writeAsString('$data', mode: FileMode.append);
  }
}

//TODO: implement buffering for file write
