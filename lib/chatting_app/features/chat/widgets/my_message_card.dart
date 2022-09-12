import 'package:alnagel/chatting_app/features/chat/widgets/display_text_image_gif.dart';
import 'package:alnagel/chatting_app/common/enums/message_enum.dart';
import 'package:alnagel/chatting_app/common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onLeftSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;
  final bool isSeen;

  const MyMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
    required this.onLeftSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.isSeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;

    return SwipeTo(
      onLeftSwipe: onLeftSwipe,
      child: Align(
        alignment: Alignment.centerRight,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                right: 10,
                child: Transform.rotate(
                  angle: 92,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.teal,
                  ),
                )),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 45,
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.teal,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Stack(
                  children: [
                    Padding(
                      padding: type == MessageEnum.text
                          ? const EdgeInsets.only(
                              left: 10,
                              right: 30,
                              top: 5,
                              // bottom: 20,
                              bottom: 5,
                            )
                          : const EdgeInsets.only(
                              left: 5,
                              top: 5,
                              right: 5,
                              bottom: 25,
                            ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end, //By Me
                        children: [
                          if (isReplying) ...[
                            Text(
                              username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300]),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: backgroundColor.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    5,
                                  ),
                                ),
                              ),
                              child: DisplayTextImageGIF(
                                message: repliedText,
                                type: repliedMessageType,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          Row(
                            mainAxisSize: MainAxisSize.min, //byMe
                            children: [
                              DisplayTextImageGIF(
                                message: message,
                                type: type,
                              ),
                            ],
                          ),
                          //By me alternative for positioned below
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white60,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                isSeen ? Icons.done_all : Icons.done,
                                size: 20,
                                color: isSeen ? Colors.blue : Colors.white60,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   bottom: 3,
                    //   right: 10,
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         date,
                    //         style: const TextStyle(
                    //           fontSize: 13,
                    //           color: Colors.white60,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 5,
                    //       ),
                    //       Icon(
                    //         isSeen ? Icons.done_all : Icons.done,
                    //         size: 20,
                    //         color: isSeen ? Colors.blue : Colors.white60,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
