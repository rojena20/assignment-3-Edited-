import 'package:flutter/material.dart';

import 'contact_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ContactScreen.routeName,
      routes: {
        ContactScreen.routeName: (context) => ContactScreen(),
      },
    ),
  );
}
