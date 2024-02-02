import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
  }

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const json = [
      {"insert": "teste ests \n"},
      {
        "insert": "tset",
        "attributes": {"bold": true}
      },
      {"insert": " \nsdfsgfdsg\n"}
    ];

    final QuillController controller = QuillController(
      document: Document.fromJson(json),
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
                  controller: controller,
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
