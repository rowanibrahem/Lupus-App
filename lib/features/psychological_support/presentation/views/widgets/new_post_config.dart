import 'package:flutter/material.dart';

class NewPostConfig {
  final String appBarTitle;
  final String hintText;
  final String buttonText;
  final VoidCallback? onShared;

  const NewPostConfig({
    required this.appBarTitle,
    required this.hintText,
    required this.buttonText,
    this.onShared,
  });

  // ── presets ──────────────────────────────────────────────
  factory NewPostConfig.post({VoidCallback? onShared}) => NewPostConfig(
        appBarTitle: 'أضف منشور',
        hintText: 'شاركنا أفكارك أو تجربتك...',
        buttonText: 'شارك الآن',
        onShared: onShared,
      );

  factory NewPostConfig.discussion({VoidCallback? onShared}) => NewPostConfig(
        appBarTitle: 'أضف نقاش',
        hintText: 'ما الموضوع الذي تريد مناقشته؟',
        buttonText: 'ابدأ النقاش',
        onShared: onShared,
      );

  factory NewPostConfig.story({VoidCallback? onShared}) => NewPostConfig(
        appBarTitle: 'أضف قصة',
        hintText: 'شاركنا قصتك...',
        buttonText: 'انشر القصة',
        onShared: onShared,
      );
  factory NewPostConfig.donation({VoidCallback? onShared}) => NewPostConfig(
        appBarTitle: 'أضف تبرعك',
        hintText: 'إضافة شيء للتبرع',
        buttonText: 'تبرع الآن',
        onShared: onShared,
      );
}
