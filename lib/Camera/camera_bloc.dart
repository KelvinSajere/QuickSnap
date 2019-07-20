import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CameraBloc with ChangeNotifier {
  File _selectedImage;
  set _setSelectedImage(File image) {
    _selectedImage = image;
    notifyListeners();
  }

  File get getSelectedImage => _selectedImage;

  void getBusinessCardFromGallery() async {
    final image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    _setSelectedImage = image;
  }

  void getBusinessCardFromCamera() async {
    final image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    _setSelectedImage = image;
  }
}
