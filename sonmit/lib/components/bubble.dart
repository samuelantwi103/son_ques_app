// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';

class ChatBubble extends StatefulWidget {
  final String text;
  final bool isMe;
  final String? replyTo;
  final Function(String) onSwipe;
  final VoidCallback? onReplyTap;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    this.replyTo,
    required this.onSwipe,
    this.onReplyTap,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.2, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  void handleSwipe() {
    _animationController.forward().then((_) {
      widget.onSwipe(widget.text);
      _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          handleSwipe(); // Trigger reply animation and action
        }
      },
      child: Align(
        alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: SlideTransition(
          position: _offsetAnimation,
          child: ElevatedCard(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit width to 70%
          ),
            color: widget.isMe
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: widget.isMe ? const Radius.circular(12) : Radius.zero,
              bottomRight:
                  widget.isMe ? Radius.zero : const Radius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.replyTo != null)
                  GestureDetector(
                    onTap: widget.onReplyTap, // Scroll to replied message
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.replyTo!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,

                          // color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
