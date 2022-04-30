// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notee/models/noteOperation.dart';
import 'package:notee/screens/home_screen.dart';

void main() {
  runApp(Notee());
}

class Notee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteOperation>(
      create: (_) => NoteOperation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
