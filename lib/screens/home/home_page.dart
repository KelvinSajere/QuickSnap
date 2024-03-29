import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/blocs/business_card_bloc.dart';
import 'package:quicksnap/models/business_card_entity.dart';
import 'package:quicksnap/screens/business_information/contact_page.dart';
import 'package:quicksnap/screens/home/widgets/all_business_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _optionsDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take a picture'),
                    onTap: () {
                      getImage(ImageSource.camera, context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Select from gallery'),
                    onTap: () {
                      getImage(ImageSource.gallery, context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getImage(ImageSource imageSource, BuildContext context) async {
    final image = await ImagePicker.pickImage(
      source: imageSource,
    );
    if (image != null) {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactPage(image: image),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<BusinessCardBloc>(context);
    final _future = _bloc.retrieveBusinessCards();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.contact_mail),
          onPressed: () {
            final future = _optionsDialogBox(context);
            FutureBuilder<void>(
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
                  child: FutureBuilder<List<BusinessCard>>(
                      future: _future,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<BusinessCard>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AllBusinessCard(
                            cards: snapshot.data,
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }))
            ],
          )),
    );
  }
}
