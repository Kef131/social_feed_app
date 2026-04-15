import 'package:flutter/material.dart';
import 'services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // emsire fñutter engine is initialized before any other setup
  setupServiceLocator();
  runApp(const _PlaceholderApp());
}

class _PlaceholderApp extends StatelessWidget {
  const _PlaceholderApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('SocialFeedApp - scaffold only'),
        ),
      ),
    );
  }
}