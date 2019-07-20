import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quicksnap/models/business_card_entity.dart';

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
