import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/CRUD_Contact.dart/business_card.dart';
import 'package:quicksnap/CRUD_Contact.dart/contact_page.dart';
import 'package:quicksnap/Camera/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _optionsDialogBox(BuildContext context) {
    final _cameraBloc = Provider.of<CameraBloc>(context);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: () {
                      _cameraBloc.getBusinessCardFromCamera();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: () {
                      _cameraBloc.getBusinessCardFromGallery();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.contact_mail),
            onPressed: () async {
              //await _optionsDialogBox(context);
              final future = _optionsDialogBox(context);
              FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  }
                  return null;
                },
              );
            }),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter a search term'),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    FittedBox(
                      child: Card(
                          child:
                              Image.asset('assets/food.jpg', fit: BoxFit.fill)),
                    ),
                    FittedBox(
                      child: Card(
                          child:
                              Image.asset('assets/food.jpg', fit: BoxFit.fill)),
                    ),
                    FittedBox(
                      child: Card(
                          child:
                              Image.asset('assets/food.jpg', fit: BoxFit.fill)),
                    ),
                    FittedBox(
                      child: Card(
                          child:
                              Image.asset('assets/food.jpg', fit: BoxFit.fill)),
                    ),
                    FittedBox(
                      child: Card(
                          child:
                              Image.asset('assets/food.jpg', fit: BoxFit.fill)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
