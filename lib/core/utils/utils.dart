import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  File? image;
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    image = File(pickedFile.path);
  }

  return image;
}

Future<File?> pickVideo() async {
  File? video;
  final picker = ImagePicker();
  final file = await picker.pickVideo(
    source: ImageSource.gallery,
    maxDuration: const Duration(minutes: 5),
  );

  if (file != null) {
    video = File(file.path);
  }

  return video;
}

// Show Toast Message
void showToastMessage({
  required String text,
}) {
  Fluttertoast.showToast(
    timeInSecForIosWeb: 4,
    msg: text,
    textColor: Colors.white,
    backgroundColor: Colors.black54,
    fontSize: 14,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
  );
}
