import 'package:courseacademy/pages/application/application_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: SafeArea(
        child: Scaffold(
          body: buildPage(0)
        ),
    ),
    );
  }
}
