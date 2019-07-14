import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/Camera/camera_bloc.dart';

import 'business_card_form.dart';

/*
Contact Page containing the Business card , and extracted business card information
Contact Page => BusinessCard Form
 */
class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final _cameraBloc = Provider.of<CameraBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: FittedBox(
              child: Card(
                child: _cameraBloc.getSelectedImage == null
                    ? Center(child: CircularProgressIndicator())
                    : Image.file(_cameraBloc.getSelectedImage),
              ),
            )),
            Expanded(
                child: Card(
                    elevation: 10.00,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: BusinessCardForm())))
          ],
        ),
      ),
    );
  }
}
