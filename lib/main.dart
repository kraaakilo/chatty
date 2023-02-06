import 'package:chatty/api/openai.dart';
import 'package:chatty/components/SingleMessageComponent.dart';
import 'package:chatty/data/sender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/Test.dart';
import 'data/chat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const Chatty(),
    ),
  );
}

class Chatty extends StatefulWidget {
  const Chatty({Key? key}) : super(key: key);

  @override
  State<Chatty> createState() => _ChattyState();
}

class _ChattyState extends State<Chatty> {
  final TextEditingController _editingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Chat> chats = [];

  void addChat(String content, Sender sender) {
    Chat chat = Chat(sender: sender, content: content);
    bool isLoading = false;
    setState(() {
      chats.add(chat);
    });
  }

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
                  child: chats.isEmpty
                      ? const Center(
                          child: Text("Aucun message disponible"),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return SingleMessageComponent(chat: chats[index]);
                          },
                          itemCount: chats.length),
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
                  child: TextField(
                    controller: _editingController,
                    decoration: const InputDecoration(
                      hintText: "Tapez un Message",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintStyle: TextStyle(),
                      // border: OutlineInputBorder()
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var content = _editingController.value.text;
                      _editingController.clear();
                      FocusScope.of(context).unfocus();
                      if (content.isNotEmpty) {
                        addChat(content, Sender.user);

                        setState(() {
                          chats.add(const Chat(sender: Sender.chatty, content: ""));
                        });

                        String result = await OpenAi.completion(content);
                        addChat(result, Sender.chatty);

                        setState(() {
                          chats.removeWhere((element) => element.content.isEmpty);
                        });
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: const Icon(Icons.send),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
