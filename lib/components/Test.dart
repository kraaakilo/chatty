import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingChat extends StatefulWidget {
  const LoadingChat({Key? key}) : super(key: key);

  @override
  State<LoadingChat> createState() => _LoadingChatState();
}

class _LoadingChatState extends State<LoadingChat> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  loading = !loading;
                  print(loading);
                });
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  // margin: const EdgeInsets.symmetric(vertical: 10),
                  constraints: const BoxConstraints(
                    maxWidth: 60,
                  ),
                  color: Colors.grey,
                  child: Stack(
                    children: [
                      Positioned(
                        // duration: const Duration(seconds: 2),
                        top: 255,
                        left: 0,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            width: 5,
                            height: 5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width: 5,
                          height: 5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width: 5,
                          height: 5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
