import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/activities_tab.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/activities_tab_list.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView(this.community, {super.key});
  final Map<String, dynamic> community;

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final ValueNotifier<int> _selectedTab = ValueNotifier(0);
  final activitiesTabs = AppConstants.activitiesTabs;

  @override
  void dispose() {
    _selectedTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppText.activitiesAndNeededCases),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ), //!TODO: what
      body: Column(
        children: [
          ActivitiesTab(selectedTab: _selectedTab).paddingBottom(8),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: const Divider(color: AppColors.lightGrayColor).paddingBottom(8),
          ),
          ActivitiesTabList(
            selectedTab: _selectedTab,
            community: widget.community,
          ),
        ],
      ),
    );
  }
}
