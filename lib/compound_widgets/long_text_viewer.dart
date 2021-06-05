import 'package:flutter/material.dart';

class LongTextViewerWidget extends StatefulWidget {
  final String text;
  int visibleTextLength;
  TextStyle style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  LongTextViewerWidget(
      {@required this.text, this.style, this.visibleTextLength = 100});

  @override
  _LongTextViewerWidgetState createState() => _LongTextViewerWidgetState();
}

class _LongTextViewerWidgetState extends State<LongTextViewerWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.visibleTextLength) {
      firstHalf = widget.text.substring(0, widget.visibleTextLength);
      secondHalf =
          widget.text.substring(widget.visibleTextLength, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: GestureDetector(
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
          child: secondHalf.isEmpty
              ? Text(firstHalf, style: widget.style,)
              : Column(
                  children: <Widget>[
                    Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                        style: widget.style),
                  ],
                )),
    );
  }
}
