import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/Camera/camera_bloc.dart';

import 'business_card_form.dart';

/*
Contact Page containing the Business card , and extracted business card information
Contact Page => BusinessCard Form
 */
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CameraBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: _bloc.picturePath == null
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: FittedBox(
                    child: Card(
                      child: Center(child: Image.file(File(_bloc.picturePath))),
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
