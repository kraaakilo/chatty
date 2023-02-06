import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width: 5,
                          height: 5,
                          color: Colors.white,
                        ),
                      )
                          .animate(
                            delay: 500.ms,
                            onPlay: (controller) => controller.repeat(), // loop
                          )
                          .scale(delay: 500.ms, duration: 500.ms)
                          .fadeIn(),
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
                      )
                          .animate(
                            delay: 700.ms,
                            onPlay: (controller) => controller.repeat(), // loop
                          )
                          .scale(delay: 700.ms)
                          .fadeIn(),
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
                      )
                          .animate(
                            delay: 500.ms,
                            onPlay: (controller) => controller.repeat(), // loop
                          )
                          .scale(delay: 500.ms)
                          .fadeIn(),
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
