import 'package:chatty/data/chat.dart';
import 'package:chatty/data/sender.dart';
import 'package:flutter/material.dart';

class SingleMessageComponent extends StatefulWidget {
  const SingleMessageComponent({Key? key, required this.chat})
      : super(key: key);
  final Chat chat;

  @override
  State<SingleMessageComponent> createState() => _SingleMessageComponentState();
}

class _SingleMessageComponentState extends State<SingleMessageComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: widget.chat.sender == Sender.chatty
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: widget.chat.sender == Sender.chatty
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    // margin: const EdgeInsets.symmetric(vertical: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75
                    ),
                    color: widget.chat.sender == Sender.chatty
                        ? Colors.grey
                        : Colors.blue,
                    child: Text(
                      widget.chat.content,
                      style: TextStyle(
                        color: widget.chat.sender == Sender.chatty
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: widget.chat.sender == Sender.chatty
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: const <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "04:30 PM",
              style: TextStyle(
                fontSize: 8,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
