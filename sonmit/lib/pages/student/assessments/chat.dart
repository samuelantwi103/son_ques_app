import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sonmit/components/bubble.dart';
import 'package:sonmit/components/text_field.dart';
import 'package:sonmit/services/flags.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late FocusNode _focusNode;

  String? replyMessage;
  final ScrollController _scrollController = ScrollController();
  final Map<String, int> _messageIndexes = {};
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "text": "Hey, how are you?",
      "isMe": false,
      "replyTo": null,
    },
    {
      "text": "I'm good, thanks! How about you?",
      "isMe": true,
      "replyTo": "Hey, how are you?",
    },
    {
      "text": "Doing great!",
      "isMe": false,
      "replyTo": "I'm good, thanks! How about you?",
    },
  ];

  @override
  void initState() {
    super.initState();
    if (!kIsWeb && Platform.isAndroid) enableFlags();

    _focusNode = FocusNode();

    // Map messages to their indexes for scrolling
    for (int i = 0; i < messages.length; i++) {
      _messageIndexes[messages[i]["text"]] = i;
    }

    // Request focus after the widget tree builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    // Add a listener to ensure persistent focus
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) _focusNode.requestFocus();
        });
      }
    });
  }

  void _scrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _scrollToMessage(String? message) {
    if (message != null && _messageIndexes.containsKey(message)) {
      final index = _messageIndexes[message]!;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          final position = index * 100.0; // Approximate bubble height
          _scrollController.animateTo(
            position,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void handleReply(String message) {
    setState(() {
      replyMessage = message;
    });
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        "text": text,
        "isMe": true,
        "replyTo": replyMessage,
      });
      replyMessage = null;
      messageController.clear();
      _messageIndexes[text] = messages.length - 1; // Update message index
    });

    _scrollToBottom();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CupertinoNavigationBarBackButton(),
        title: Text(
          "Help Session",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              // Ensure the keyboard persists on taps outside the text field
              onTap: () {
                if (!_focusNode.hasFocus) {
                  _focusNode.requestFocus();
                }
              },
              child: ListView.builder(
                controller: _scrollController,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ChatBubble(
                    text: message["text"],
                    isMe: message["isMe"],
                    replyTo: message["replyTo"],
                    onSwipe: handleReply,
                    onReplyTap: () {
                      _scrollToMessage(message["replyTo"]);
                    },
                  );
                },
              ),
            ),
          ),
          if (replyMessage != null)
            Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Replying to: $replyMessage",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => replyMessage = null),
                  )
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: FormTextField(
                    controller: messageController,
                    focusNode: _focusNode,
                    hintText: 'Type a message...',
                    autofocus: true,
                    onTapOutside: (p0) {
                      // Ensure focus remains persistent
                      if (!_focusNode.hasFocus) {
                        _focusNode.requestFocus();
                      }
                    },
                    onFieldSubmitted: sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text.trim());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
