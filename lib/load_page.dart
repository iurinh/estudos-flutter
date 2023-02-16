import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class LoadPage extends StatefulWidget {
  final String json;
  const LoadPage(this.json, {super.key});

  @override
  State<LoadPage> createState() => _LoadPageState(json);
}

class _LoadPageState extends State<LoadPage> {
    
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
      appBar: AppBar(
        title: const SelectableText("Load")
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,          
          children: [
            Expanded(
              child: QuillEditor(
                readOnly: true,
                controller: _controller, 
                showCursor: false,
                autoFocus: false,
                expands: true, 
                focusNode: _focusNode, 
                padding: EdgeInsets.zero, 
                scrollController: ScrollController(), 
                scrollable: true,
              ),
            )
          ],
        ),
      ),
    );
  }

}