import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ImagePickerBS extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final VoidCallback onGalleryTap;

  ImagePickerBS({this.onCameraTap, required this.onGalleryTap});

  @override
  Widget build(BuildContext context) {
    void close() {
      Navigator.of(context).maybePop();
    }

    return Material(
      color: NeumorphicTheme.baseColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SafeArea(
        child: Container(
            decoration: new BoxDecoration(
                color: NeumorphicTheme.baseColor(context),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (onCameraTap != null)
                    ? ListTile(
                        leading: Icon(
                          Icons.photo_camera,
                          color: NeumorphicTheme.accentColor(context),
                          size: 24.0,
                        ),
                        title: new Text(
                          'Camera',
                          style: kLTwoTextStyle(Colors.black),
                        ),
                        onTap: () {
                          onCameraTap!();
                          close();
                        },
                      )
                    : Container(),
                (onCameraTap != null) ? Divider() : Container(),
                new ListTile(
                  leading: Icon(
                    Icons.filter,
                    color: NeumorphicTheme.accentColor(context),
                    size: 24.0,
                  ),
                  title: new Text(
                    'Photo & Video Library',
                    style: kLTwoTextStyle(Colors.black),
                  ),
                  onTap: () {
                    onGalleryTap();
                    close();
                  },
                ),
              ],
            )),
      ),
    );
  }
}
