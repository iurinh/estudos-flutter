import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hello_world/auth.dart';
import 'package:hello_world/load_page.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Auth().isAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            const Expanded(child: SelectableText("Insert"))
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuillToolbar.simple(
                configurations:
                    QuillSimpleToolbarConfigurations(controller: _controller)),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  readOnly: false,
                  controller: _controller,
                  autoFocus: true,
                  expands: true,
                  padding: EdgeInsets.zero,
                  scrollable: true,
                ),
                focusNode: _focusNode,
                scrollController: ScrollController(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: FloatingActionButton(
                onPressed: () {
                  final json =
                      jsonEncode(_controller.document.toDelta().toJson());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadPage(json)));
                },
                child: const Icon(Icons.save),
              ),
            )
          ],
        ),
      ),
    );
  }
}
