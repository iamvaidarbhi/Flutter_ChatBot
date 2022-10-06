import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageView extends StatefulWidget {
  final List messages;

  const MessageView({Key? key, required this.messages}) : super(key: key);

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Row(
            mainAxisAlignment: widget.messages[index]['isUserMessage']
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 0 : 20),
                      topLeft: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 20 : 0),
                    ),
                    color: widget.messages[index]['isUserMessage']
                        ? Colors.grey.shade800
                        : Colors.grey.shade900.withOpacity(0.8)),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(widget.messages[index]['message'].text.text[0]),
              )
            ],
          );
        }),
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
