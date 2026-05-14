import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class MedicinesActivitiesView extends StatefulWidget {
  const MedicinesActivitiesView({super.key});

  @override
  State<MedicinesActivitiesView> createState() => _MedicinesActivitiesViewState();
}

class _MedicinesActivitiesViewState extends State<MedicinesActivitiesView> {
  final ValueNotifier<int> _selectedTab = ValueNotifier(0);
  final List<String> _tabs = ['أدوية', 'مساهمات', 'دعم مادي'];

  @override
  void dispose() {
    _selectedTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأنشطة والحالات المحتاجة'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                // ── Search ──────────────────────────────
                _SearchField(),
                const SizedBox(height: 14),

                // ── Tabs ────────────────────────────────
                ValueListenableBuilder<int>(
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
                              margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
                              height: 40,
                              decoration: BoxDecoration(
                                color: selected == index
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _tabs[index],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: selected == index
                                      ? Colors.white
                                      : AppColors.grayColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          const Divider(color: Color(0xffACACAC)),

          // ── List ────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: AppConstants.medicinesCases.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = AppConstants.medicinesCases[index];
                return _MedicineCaseCard(
                  title: item['title']!,
                  description: item['description']!,
                  image: item['image']!,
                  onContact: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── Search Field ──────────────────────────────────────────
class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'ابحث عن أعراض، نصائح، أو معلومات',
        hintStyle: const TextStyle(fontSize: 12, color: AppColors.grayColor),
        suffixIcon: const Icon(Icons.search, color: AppColors.grayColor),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

// ── Medicine Case Card ────────────────────────────────────
class _MedicineCaseCard extends StatelessWidget {
  const _MedicineCaseCard({
    required this.title,
    required this.description,
    required this.image,
    required this.onContact,
  });

  final String title;
  final String description;
  final String image;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EEFF),
        borderRadius: BorderRadius.circular(18),
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
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: onContact,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'تواصل مع الحالة',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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