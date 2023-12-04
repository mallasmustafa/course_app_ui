
import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/utils/data.dart';
import 'package:online_course_app/widgets/chat_appbar.dart';
import 'package:online_course_app/widgets/chat_list.dart';
import 'package:online_course_app/widgets/chat_search_block.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: ChatAppBar(),
        ),
        const SliverToBoxAdapter(
          child: ChatSearchBlock(),
        ),
        SliverToBoxAdapter(
          child: ChatRecentChatList(chats: chats),
        )
      ],
    );
  }
}