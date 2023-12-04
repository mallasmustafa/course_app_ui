import 'package:flutter/material.dart';
import 'package:online_course_app/widgets/chat_item.dart';

class ChatRecentChatList extends StatelessWidget {
  const ChatRecentChatList({super.key, required this.chats});
  final List chats;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      children: List.generate(
          chats.length, (index) => ChatItem(chatData: chats[index])),
    );
  }
}
