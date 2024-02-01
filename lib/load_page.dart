import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hello_world/home_page.dart';

class LoadPage extends StatefulWidget {
  final String json;
  const LoadPage(this.json, {super.key});

  @override
  State<LoadPage> createState() => _LoadPageState(json);
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();

    Future(() {
      if (true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  final FocusNode _focusNode = FocusNode();
  final String json;

  _LoadPageState(this.json);

  @override
  Widget build(BuildContext context) {
    final QuillController _controller = QuillController(
      document: Document.fromJson(jsonDecode(json)),
      selection: const TextSelection.collapsed(offset: 0),
    );

    return Scaffold(
      appBar: AppBar(title: const SelectableText("Load")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  readOnly: true,
                  controller: _controller,
                  showCursor: false,
                  autoFocus: false,
                  expands: true,
                  padding: EdgeInsets.zero,
                  scrollable: true,
                ),
                focusNode: _focusNode,
                scrollController: ScrollController(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
