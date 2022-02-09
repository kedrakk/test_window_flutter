import 'dart:io';

import 'package:flutter/material.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({ Key? key,required this.file, }) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.path.substring(file.path.lastIndexOf("\\"))),
      ),
      body: Center(
        child: Text(file.path.characters.toString()),
      ),
    );
  }
}