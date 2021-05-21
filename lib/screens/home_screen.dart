import 'package:flutter/material.dart';
import 'package:flutter_app/screens/band_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: BandSelectionScreen(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
