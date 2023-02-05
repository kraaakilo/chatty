import 'package:chatty/components/SingleMessageComponent.dart';
import 'package:chatty/data/db.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Chatty(),
    ),
  );
}

class Chatty extends StatefulWidget {
  const Chatty({Key? key}) : super(key: key);

  @override
  State<Chatty> createState() => _ChattyState();
}

class _ChattyState extends State<Chatty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0e6f3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),
                  Text(
                    "Chatty",
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(Icons.info),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SingleMessageComponent(
                            chat: chatsDatabase[index]);
                      },
                      itemCount: chatsDatabase.length),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Tapez un Message",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: TextStyle(),
                      // border: OutlineInputBorder()
                    ),
                  ),
                ),
                const Expanded(
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
