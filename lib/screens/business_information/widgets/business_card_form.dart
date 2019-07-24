import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/blocs/business_card_bloc.dart';
import 'package:quicksnap/models/business_card_entity.dart';

/*
 *Business Card Form used to perform CRUD function on Business Card information
 *  
 */
class BusinessCardForm extends StatefulWidget {
  final File _imageUrl;
  BusinessCardForm({Key key, @required File imageUrl})
      : this._imageUrl = imageUrl,
        super(key: key);
  @override
  _BusinessCardFormState createState() => _BusinessCardFormState();
}

class _BusinessCardFormState extends State<BusinessCardForm> {
  final _formKey = GlobalKey<FormState>();
  var _businessCard = BusinessCard();
  FocusNode _clientNameFocus;
  FocusNode _roleFocus;
  FocusNode _phoneNumberFocus;
  FocusNode _emailFocus;
  FocusNode _webFocus;
  FocusNode _addressFocus;
  FocusNode _buttonFocus;

  @override
  void initState() {
    super.initState();
    _clientNameFocus = FocusNode();
    _roleFocus = FocusNode();
    _phoneNumberFocus = FocusNode();
    _emailFocus = FocusNode();
    _webFocus = FocusNode();
    _addressFocus = FocusNode();
    _buttonFocus = FocusNode();
  }

  @override
  void dispose() {
    disposeFocus();
    super.dispose();
  }

  void disposeFocus() {
    _clientNameFocus.dispose();
    _roleFocus.dispose();
    _phoneNumberFocus.dispose();
    _emailFocus.dispose();
    _webFocus.dispose();
    _addressFocus.dispose();
    _buttonFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _crudBusinessCard = Provider.of<BusinessCardBloc>(context);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                key: Key("businessName"),
                textInputAction: TextInputAction.next,
                autofocus: true,
                validator: (val) => _crudBusinessCard.validateRequiredInput(
                    val, "Business Name"),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_clientNameFocus);
                },
                onSaved: (val) {
                  _businessCard.setBusinessName = val;
                },
                decoration: InputDecoration(
                    labelText: "Business Name", icon: Icon(Icons.business)),
              ),
              TextFormField(
                key: Key("clientName"),
                focusNode: _clientNameFocus,
                textInputAction: TextInputAction.next,
                validator: (val) =>
                    _crudBusinessCard.validateRequiredInput(val, "Client Name"),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_roleFocus);
                },
                onSaved: (val) => _businessCard.setClientName = val,
                decoration: InputDecoration(
                    labelText: "Client Name", icon: Icon(Icons.person)),
              ),
              TextFormField(
                key: Key("role"),
                focusNode: _roleFocus,
                textInputAction: TextInputAction.next,
                validator: (val) =>
                    _crudBusinessCard.validateRequiredInput(val, "Role"),
                onSaved: (val) => _businessCard.setRole = val,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_phoneNumberFocus);
                },
                decoration: InputDecoration(
                    labelText: "Role",
                    icon: Icon(Icons.title),
                    hintText: "Vice President"),
              ),
              TextFormField(
                key: Key("phoneNumber"),
                focusNode: _phoneNumberFocus,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                onSaved: (val) => _businessCard.setPhoneNumber = val,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                validator: (val) =>
                    _crudBusinessCard.validateRequiredInput(val, "Phone"),
                decoration: InputDecoration(
                    labelText: "Phone Number", icon: Icon(Icons.phone_android)),
              ),
              TextFormField(
                key: Key("email"),
                focusNode: _emailFocus,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: _crudBusinessCard.validateEmail,
                onSaved: (val) => _businessCard.setPhoneNumber = val,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_webFocus);
                },
                decoration: InputDecoration(
                    labelText: "Email Address",
                    icon: Icon(Icons.web),
                    hintText: "e.g example@example.com"),
              ),
              TextFormField(
                key: Key("webSite"),
                focusNode: _webFocus,
                textInputAction: TextInputAction.next,
                validator: _crudBusinessCard.validateWebUrl,
                keyboardType: TextInputType.text,
                onSaved: (val) => _businessCard.setWebUrl = val,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_addressFocus);
                },
                decoration: InputDecoration(
                    labelText: "Website",
                    icon: Icon(Icons.web),
                    hintText: "e.g Google.com"),
              ),
              TextFormField(
                key: Key("address"),
                focusNode: _addressFocus,
                textInputAction: TextInputAction.done,
                validator: (val) =>
                    _crudBusinessCard.validateRequiredInput(val, "Address"),
                onSaved: (val) => _businessCard.setAddress = val,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_buttonFocus);
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.location_city), labelText: "Address"),
              ),
              Center(
                child: RaisedButton(
                  key: Key("submitButton"),
                  focusNode: _buttonFocus,
                  onPressed: () {
                    onSaveButtonPressed(context);
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }

/*
 * On SUbmit button Event
 *  */
  void onSaveButtonPressed(BuildContext context) async {
    final _crudBusinessCard = Provider.of<BusinessCardBloc>(context);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _businessCard.setImageUrl = widget._imageUrl.path;
      final saved = await _crudBusinessCard.saveNewBusinessCard(_businessCard);
      if (saved > 0) {
        _formKey.currentState.reset();
        final snackBar =
            SnackBar(content: Text('Business Card Saved Successfully'));
        Scaffold.of(context).showSnackBar(snackBar);
        Future<void>.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }
    }
  }
}
