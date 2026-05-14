import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/community_support/presentation/views/charity_details_view.dart';

class CharitiesView extends StatelessWidget {
  const CharitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الجمعيات والدعم المجتمعي'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Search ──────────────────────────────────────
            _SearchField(),

            const SizedBox(height: 24),

            // ── Title ────────────────────────────────────────
            const Text(
              'جمعيات موصى بها',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),

            const SizedBox(height: 12),

            // ── List ─────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                itemCount: AppConstants.charities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final charity = AppConstants.charities[index];
                  return _CharityCard(
                    name: charity['name']!,
                    description: charity['description']!,
                    location: charity['location']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CharityDetailsView()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
        hintText: 'ابحث عن جمعية أو نشاط...',
        hintStyle: const TextStyle(
          fontSize: 13,
          color: AppColors.grayColor,
        ),
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

// ── Charity Card ──────────────────────────────────────────
class _CharityCard extends StatelessWidget {
  const _CharityCard({
    required this.name,
    required this.description,
    required this.location,
    required this.onTap,
  });

  final String name;
  final String description;
  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),

          const SizedBox(height: 6),

          // description
          Text(
            description,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.grayColor,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 8),

          // location
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 14),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // button
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'اعرف المزيد',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
