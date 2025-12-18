import 'dart:developer';

import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  const DisplayWidget({
    super.key,
    required this.displayText,
  });

  final String displayText;

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  late String _text;

  @override
  void initState() {
    super.initState();
    log("", name: "Init state");
    _text = widget.displayText;
  }

  @override
  void didUpdateWidget(covariant DisplayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("", name: "didUpdateWidget");
    if (oldWidget != widget) {
      _text = widget.displayText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
