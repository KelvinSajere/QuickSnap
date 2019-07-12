import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

/*This BLOC component with business event and states */

class CameraBloc with ChangeNotifier {
  Future<void> _initializeControllerFuture;
  CameraController _controller;
  String _url;
/*This defines the state of camera  */
  Future<void> get getInitializeControllerFuture => _initializeControllerFuture;

  CameraController get getController => _controller;

  String get picturePath => _url;

  set _setInitializeControllerFuture(Future<void> initContFuture) {
    _initializeControllerFuture = initContFuture;
    //Notifier all widget connected this logic
    notifyListeners();
  }

  set _setController(CameraController cont) {
    _controller = cont;
    notifyListeners();
  }

  set _setPicturePath(String url) {
    _url = url;
    notifyListeners();
  }

  setUpCamera() async {
    if (_controller == null || !_controller.value.isInitialized) {
      final cameras = await availableCameras();
      final _camera = cameras.first;
      final controller = CameraController(
          // Get a specific camera from the list of available cameras.
          _camera,
          // Define the resolution to use.
          ResolutionPreset.medium);
      await controller.initialize();
      _setController = controller;
      this._setInitializeControllerFuture = Future<void>.value();
    }
  }

  void takePicture() async {
    // await _initializeControllerFuture;

    // Construct the path where the image should be saved using the
    // pattern package.
    final path = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.png',
    );

    // Attempt to take a picture and log where it's been saved.
    await _controller.takePicture(path);
    _setPicturePath = path;
  }
}
