

import 'package:flutter/material.dart';
import 'package:layout_flutter/presentation/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "Layout example",
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(250,250,250, 1)
      ),
      home: Home(),
    );
  }

}

