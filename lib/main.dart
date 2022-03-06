import 'package:bloc_sample_project/feature/uplabs_page/view/uplabsview.dart';
import 'package:flutter/material.dart';

import 'feature/homepage/view/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home:  UplabsView(),
    );
  }
}
