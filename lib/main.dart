import "package:flutter/material.dart";
import "homepage.dart";

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "chat App",
      home: Homepage(),
    );
  }
}
