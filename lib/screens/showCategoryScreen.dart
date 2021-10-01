import 'package:flutter/material.dart';

class ShowCategoryScreen extends StatelessWidget {
  const ShowCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('Category'),
        ),
      ),
    );
  }
}
