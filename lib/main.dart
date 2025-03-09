import 'package:defifundr_mobile/app.dart';
import 'package:flutter/material.dart' show runApp;

void main() => _initializeImportantResources().then(
      (_) => runApp(
        const App(),
      ),
    );

Future<void> _initializeImportantResources() async {}
