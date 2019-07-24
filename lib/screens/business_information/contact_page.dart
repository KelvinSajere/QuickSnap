import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quicksnap/screens/business_information/widgets/business_card_form.dart';

/*
Contact Page containing the Business card , and extracted business card information
Contact Page => BusinessCard Form
 */
class ContactPage extends StatelessWidget {
  final File _image;
  const ContactPage({Key key, File image})
      : this._image = image,
        super(key: key);
  Widget build(BuildContext context) {
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
                child: _image == null
                    ? Center(child: CircularProgressIndicator())
                    : Image.file(_image),
              ),
            )),
            Expanded(
                child: Card(
                    elevation: 10.00,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: BusinessCardForm(imageUrl: _image))))
          ],
        ),
      ),
    );
  }
}
