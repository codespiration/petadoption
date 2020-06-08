import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_ui/adoption_screen.dart';
import 'package:pets_ui/animal_detail_screen.dart';
import 'package:pets_ui/menu_frame.dart';
import 'package:pets_ui/menu_screen.dart';

void main() {
  runApp(MyApp());
}

Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
Color startingColor = Color.fromRGBO(70, 112, 112, 1.0);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: MenuFrame(),
    );
  }
}
