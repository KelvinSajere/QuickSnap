import 'package:flutter/material.dart';
import 'package:quicksnap/Home/Home_page.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/business_card/business_card_bloc.dart';

import 'Camera/camera_bloc.dart';

void main() {
  runApp(
    MultiProvider(providers: <SingleChildCloneableWidget>[
      ChangeNotifierProvider<CameraBloc>(
          builder: (BuildContext context) => CameraBloc()),
      ChangeNotifierProvider<BusinessCardBloc>(
          builder: (BuildContext context) => BusinessCardBloc())
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quick Snap',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue),
        home: HomePage());
  }
}
