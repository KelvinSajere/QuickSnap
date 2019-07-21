import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/business_card_bloc.dart';
import 'screens/home/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<BusinessCardBloc>(
      builder: (BuildContext context) => BusinessCardBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quick Snap',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage());
  }
}
