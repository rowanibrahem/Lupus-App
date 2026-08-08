import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  int selectedTab = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'أصدقاء',
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SvgPicture.asset("assets/icons/add_square.svg"),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 22),
              _TopTabs(
                selectedTab: selectedTab,
                onChanged: (index) => setState(() => selectedTab = index),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: AppConstants.friendsNames.length,
                  separatorBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(right: 48, top: 16, bottom: 16),
                    child: (selectedTab == 0) ? Divider(color: Colors.black.withValues(alpha: .15), height: 1) : SizedBox(),
                  ),
                  itemBuilder: (context, index) {
                    final friend = AppConstants.friendsNames[index];
                    return (selectedTab == 0) ? FriendCard(friend) : FriendRequestCard(friend);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopTabs extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onChanged;

  const _TopTabs({
    required this.selectedTab,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffEEE8F5),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          _tab(title: "أصدقاء", index: 0),
          _tab(title: "طلبات صداقة", index: 1),
        ],
      ),
    );
  }

  Widget _tab({required String title, required int index}) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff6C18D8) : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final Map<String, String> friend;
  const FriendCard(this.friend, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.friendChat),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← align top
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(friend["image"]!),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend["name"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "شارك تجربتك واستمع لآخرين يمرّون بما تمرّ به",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // const Icon(Icons.mark_chat_unread_outlined),
          SvgPicture.asset("assets/icons/chatting.svg"),
        ],
      ),
    );
  }
}

class FriendRequestCard extends StatelessWidget {
  final Map<String, String> friend;
  const FriendRequestCard(this.friend, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(friend["image"]!),
          ),
          const SizedBox(width: 12),
          Text(
            friend["name"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          Spacer(),
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset("assets/icons/checkmark.svg"),
              SvgPicture.asset("assets/icons/cancel.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
