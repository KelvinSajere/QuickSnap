import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'camera_bloc.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CameraBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Take A Picture'),
        ),
        body: FutureBuilder<void>(
          future: _bloc.getInitializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_bloc.getController);
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              child: Icon(Icons.camera_enhance),
              onPressed: () {
                _bloc.takePicture();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(),
                    ));
              },
            )));
  }
}

class DisplayPictureScreen extends StatelessWidget {
  Widget getImageProvider(String path) {
    return path != null ? Image.file(File(path)) : CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CameraBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: getImageProvider(_bloc.picturePath),
    );
  }
}
