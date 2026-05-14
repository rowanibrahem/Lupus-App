import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/community_support/presentation/views/donation_methods_view.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

class CaseDetailsView extends StatelessWidget {
  const CaseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأنشطة والحالات المحتاجة'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ── Illustration ──────────────────────
                  _IllustrationSection(),

                  // ── Details ───────────────────────────
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        const Text(
                          'مطلوب دعم مادي عاجل',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // description
                        const Text(
                          'مريضة ذئبة غير قادرة على توفير تكاليف العلاج الشهرية.\nساهم معنا في تخفيف العبء ومساعدتها على استكمال علاجها.',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grayColor,
                            height: 1.7,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // amount
                        const Text(
                          'المبلغ المطلوب 3000ج',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // progress bar + percent
                        Row(
                          children: [
                            const Text(
                              '70%',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const LinearProgressIndicator(
                                  value: 0.7,
                                  minHeight: 10,
                                  backgroundColor: AppColors.lightGrayColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // remaining
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'باقي 500ج',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Donate Button ──────────────────────────────
          _DonateButton(onTap: () {
            Navigator.pushNamed(
              context,
              Routes.createContent,
              arguments: NewPostConfig.donation(
                onShared: () {
                  //  Navigator.pop(context);
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DonationMethodsView(),
                              ),
                            );
                  
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ── Illustration Section ──────────────────────────────────
class _IllustrationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      height: 250,
      // decoration: BoxDecoration(
      //   color: const Color(0xFFF5EEFF),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/charity_illustration.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// ── Donate Button ─────────────────────────────────────────
class _DonateButton extends StatelessWidget {
  const _DonateButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'تبرع الان',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
