import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/theme/styles.dart';

class MessageSection extends StatelessWidget {
  const MessageSection({super.key});

  // 💡 List of quotes
  static final List<String> quotes = [
    "أنتِ أقوى مما تظنين 💜",
    "جسمك محتاج حبك مش ضغطك 🤍",
    "كل يوم بتعديه هو إنجاز 👏",
    "الراحة مش ضعف… دي قوة 🌿",
    "خدي نفس عميق… وكملي ✨",
    "مش لازم تبقي مثالية… كفاية إنك بتحاولي 💫",
    "حتى في التعب… إنتي لسه بتكملي 💪",
  ];

  @override
  Widget build(BuildContext context) {
    // 📅 change quote daily
    int index = DateTime.now().day % quotes.length;
    String todayQuote = quotes[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(
          AppText.dailyMessageTitle,
          style: Styles.textStyle14(context).copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        /// Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF3F0FA),
                Color(0xFFE9E3F8),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black..withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 💜 icon
              const Text(
                "💜",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(width: 10),

              /// quote
              Expanded(
                child: Text(
                  todayQuote,
                  textAlign: TextAlign.right,
                  style: Styles.textStyle14(context).copyWith(
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
