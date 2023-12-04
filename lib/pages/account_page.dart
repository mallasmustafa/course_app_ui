import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/utils/data.dart';
import 'package:online_course_app/widgets/account_appbar.dart';
import 'package:online_course_app/widgets/account_profile_block.dart';
import 'package:online_course_app/widgets/account_record_block.dart';
import 'package:online_course_app/widgets/account_section1.dart';
import 'package:online_course_app/widgets/account_section2.dart';
import 'package:online_course_app/widgets/account_section3.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: AccountAppBar(),
        ),
        SliverToBoxAdapter(
          child: _buildBody(),
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          AccountProfileBlock(profile: profile),
          const SizedBox(
            height: 20,
          ),
          const AccountRecordBlock(),
          const SizedBox(
            height: 20,
          ),
          const AccountBlock1(),
          const SizedBox(
            height: 20,
          ),
          const AccountBlock2(),
          const SizedBox(
            height: 20,
          ),
          const AccountBlock3()
        ],
      ),
    );
  }
}
