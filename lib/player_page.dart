import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:window_player/reader_page.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reader"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(
                  10,
                ),
              ),
            ),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(type: FileType.any, allowedExtensions: ['pdf']);
              if (result == null) {
                errorDialog("Cancelled Operation", context);
              } else if (!result.files.single.path!.endsWith(".pdf")) {
                errorDialog("Wrong File Format!", context);
              } else {
                File file = File(result.files.single.path!);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReaderPage(file: file,),),);
              }
            },
            icon: const Icon(Icons.add),
            label: const Text("Import File")),
      ),
    );
  }
}

errorDialog(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cannot Open The File"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        );
      });
}
