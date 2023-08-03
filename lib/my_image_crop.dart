import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> myImageCropper({
  required File file,
  required BuildContext context,
}) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: file.path,
    compressQuality: 100,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    // -> fixed ratio
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ],

    uiSettings: [
      AndroidUiSettings(
        backgroundColor: Colors.grey,
        cropGridColor: Colors.transparent,
        cropFrameColor: Colors.grey,
        showCropGrid: true,
        activeControlsWidgetColor: Colors.white,
        lockAspectRatio: true,
        toolbarColor: Color(0xffB5C0FF),
        toolbarTitle: "Crop Image",
        statusBarColor: Color(0xffB5C0FF),
        hideBottomControls: true,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
      ),
      IOSUiSettings(),
      WebUiSettings(context: context),
    ],
  );


  if(croppedFile!=null) return File(croppedFile.path);
  return null;
}
