import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController with ChangeNotifier{
  File _image;
  ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    var pickedFile = await _picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('done');
      } else {
        print('No image selected.');
      }
      notifyListeners();
    }

  File get image => _image;
}