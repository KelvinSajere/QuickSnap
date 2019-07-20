import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/Camera/index.dart';
import 'package:quicksnap/business_card/business_card_bloc.dart';
import 'package:quicksnap/business_card/business_card_entity.dart';
import 'package:quicksnap/business_card/contact_page.dart';

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
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactPage(),
                            maintainState: false),
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
    final _bloc = Provider.of<BusinessCardBloc>(context);
    final _future = _bloc.retrieveBusinessCards();
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.contact_mail),
            onPressed: () async {
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
        body: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<BusinessCard> cards = snapshot.data;
              return AllBusinessCard(
                cards: cards,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class AllBusinessCard extends StatelessWidget {
  final List<BusinessCard> _cards;

  const AllBusinessCard({Key key, @required List<BusinessCard> cards})
      : this._cards = cards,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    children: _cards.isNotEmpty
                        ? _cards
                            .map((element) => Card(
                                    child: Image.file(
                                  File(element.getImageUrl),
                                  height: 250,
                                  fit: BoxFit.fill,
                                )))
                            .toList()
                        : []))
          ],
        ));
  }
}
