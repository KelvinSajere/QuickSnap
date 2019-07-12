import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactPage extends StatelessWidget {
  @override
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
                child: Center(
                    child: Image.asset('assets/food.jpg', fit: BoxFit.fill)),
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

class BusinessCardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Business Name", icon: Icon(Icons.business)),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Client Name", icon: Icon(Icons.person)),
              ),
              TextFormField(
                decoration:
                    InputDecoration(hintText: "Role", icon: Icon(Icons.title)),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Phone Number", icon: Icon(Icons.phone_android)),
              ),
              TextFormField(
                decoration:
                    InputDecoration(hintText: "Website", icon: Icon(Icons.web)),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Address", icon: Icon(Icons.location_city)),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
