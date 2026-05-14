import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/community_support/presentation/views/case_details_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/contribution_details_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/donation_methods_view.dart';
import 'package:lupus_app/features/community_support/presentation/views/quick_contact_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final ValueNotifier<int> _selectedTab = ValueNotifier(0);

  final List<String> _tabs = ['الدعم المادي', 'مساهمات', 'أدوية'];

  @override
  void dispose() {
    _selectedTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأنشطة والحالات المحتاجة'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // ── Tabs ────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedTab,
              builder: (context, selected, _) {
                return Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () => _selectedTab.value = index,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.only(
                            left: index == 0 ? 0 : 8,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            color: selected == index ? AppColors.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: selected == index ? Colors.white : AppColors.grayColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),
          const Divider(color: Color(0xffACACAC)),
          // ── List ────────────────────────────────────────
          ValueListenableBuilder<int>(
            valueListenable: _selectedTab,
            builder: (context, selected, _) {
              return Expanded(
                child: switch (selected) {
                  // ── Tab 0: الدعم المادي ──────────────
                  0 => ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: AppConstants.charityCases.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = AppConstants.charityCases[index];
                        return _CaseCard(
                          title: item['title']!,
                          amount: item['amount']!,
                          remaining: item['remaining']!,
                          progress: double.parse(item['progress']!),
                          image: item['image']!,
                          onDonate: () => Navigator.pushNamed(
                            context,
                            Routes.createContent,
                            arguments: NewPostConfig.donation(
                              onShared: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DonationMethodsView(),
                                  ),
                                );
                              },
                            ),
                          ),
                          onDetails: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CaseDetailsView(),
                            ),
                          ),
                        );
                      },
                    ),

                  // Tab 1: مساهمات
                  1 => ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: AppConstants.contributions.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = AppConstants.contributions[index];
                        return _ContributionCard(
                          title: item['title']!,
                          description: item['description']!,
                          image: item['image']!,
                          buttonLabel: 'عرض التفاصيل', // ← contributions tab label
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContributionDetailsView(),
                              ),
                            );
                          },
                        );
                      },
                    ),

// Tab 2: أدوية
                  _ => ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: AppConstants.medicinesCases.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = AppConstants.medicinesCases[index];
                        return _ContributionCard(
                          title: item['title']!,
                          description: item['description']!,
                          image: item['image']!,
                          buttonLabel: 'تواصل مع الحالة', // ← medicines tab label
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuickContactView(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                },
              );
            },
          ),

          // // ── List ────────────────────────────────────────
          // // if (_selectedTab == 0)
          // Expanded(
          //   child: ListView.separated(
          //     padding: const EdgeInsets.all(16),
          //     itemCount: AppConstants.charityCases.length,
          //     separatorBuilder: (_, __) => const SizedBox(height: 16),
          //     itemBuilder: (context, index) {
          //       final item = AppConstants.charityCases[index];
          //       return _CaseCard(
          //         title: item['title']!,
          //         amount: item['amount']!,
          //         remaining: item['remaining']!,
          //         progress: double.parse(item['progress']!),
          //         image: item['image']!,
          //         onDonate: () {
          //           Navigator.pushNamed(context, Routes.createContent, arguments: NewPostConfig.donation());
          //         },
          //         onDetails: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const CaseDetailsView(),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          // Text("الدعم المادي")
          // if (_selectedTab == 1) Text("مساهمات") else if (_selectedTab == 2) Text("أدوية")
        ],
      ),
    );
  }
}

class _ContributionCard extends StatelessWidget {
  const _ContributionCard({
    required this.title,
    required this.description,
    required this.image,
    required this.buttonLabel,
    required this.onTap,
  });

  final String title;
  final String description;
  final String image;
  final String buttonLabel; // 'تواصل مع الحالة' or 'عرض التفاصيل'
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── text + button ──────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      buttonLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ── illustration ───────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Case Card ─────────────────────────────────────────────
class _CaseCard extends StatelessWidget {
  const _CaseCard({
    required this.title,
    required this.amount,
    required this.remaining,
    required this.progress,
    required this.image,
    required this.onDonate,
    required this.onDetails,
  });

  final String title;
  final String amount;
  final String remaining;
  final double progress; // 0.0 → 1.0
  final String image;
  final VoidCallback onDonate;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Container(
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ── illustration ─────────────────────────────
          ClipRRect(
            // borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(image, width: double.infinity, height: 160, fit: BoxFit.cover),
          ),
          const SizedBox(height: 14),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),

                const SizedBox(height: 4),

                // amount
                Text(
                  'المبلغ المطلوب $amount',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                  ),
                ),

                const SizedBox(height: 10),

                // progress bar + percent
                Row(
                  children: [
                    Text(
                      '$percent%',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          backgroundColor: AppColors.lightGrayColor,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // remaining
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'باقي $remaining',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayColor,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // buttons
                Row(
                  children: [
                    // details
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: OutlinedButton(
                          onPressed: onDetails,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'تفاصيل الحالة',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // donate
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: ElevatedButton(
                          onPressed: onDonate,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'تبرع الان',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
