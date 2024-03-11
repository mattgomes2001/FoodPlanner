import 'package:flutter/material.dart';
import 'data_classes.dart';

void maine() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Planificateur de repas'),
        ),
        body: Center(
            // Corps de la page
            ),
      ),
    );
  }
}
