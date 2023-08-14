import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ocr_app/utils/routes.dart';
import 'package:image_picker/image_picker.dart';

Widget uploadButton(BuildContext context) {
  return Hero(
    tag: const Key("upload"),
    child: Card(
      color: Colors.grey.shade700,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MyRoutes.uploadpage);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          height: 40,
          width: 400,
          child: const Center(
            child: Text(
              "Upload Image",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget preview(XFile? imageFile, dynamic pickerror) {
  if (imageFile != null) {
    if (kIsWeb) {
      EasyLoading.dismiss();
      return Image.network(imageFile.path, fit: BoxFit.cover);
    } else {
      EasyLoading.dismiss();
      return Semantics(
          label: 'image_picked_image', child: Image.file(File(imageFile.path)));
    }
  } else if (pickerror != null) {
    EasyLoading.dismiss();
    return const Text(
      'Error: Select An Image (.PNG,.JPG,.JPEG,..) \nand Wait a Few Seconds',
      textAlign: TextAlign.center,
    );
  } else {
    EasyLoading.dismiss();
    return const Text(
      'You have not yet picked an image\nUpload an Image',
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}

Widget extractedText(String? extracted) {
  return Container(
    color: Colors.grey.shade600,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SelectableText(
            extracted.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

Widget bottomNavBarDesign() {
  return Container(width: 500, height: 20, color: Colors.grey.shade800);
}