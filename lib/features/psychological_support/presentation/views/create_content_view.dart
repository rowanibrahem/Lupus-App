import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

class CreateContentView extends StatelessWidget {
  const CreateContentView({super.key, required this.config});

  final NewPostConfig config;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> selectedPostType =
        ValueNotifier<String?>(AppConstants.postTypes.first["title"]);

    return Scaffold(
      appBar: CustomAppBar(title: config.appBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── header row ──────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Image.asset("assets/images/chat1.png"),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "أمل محمد",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: selectedPostType,
                  builder: (context, value, _) {
                    return DropdownMenu<String>(
                      initialSelection: value,
                      onSelected: (v) => selectedPostType.value = v,
                      trailingIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
                      selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 18),
                      textStyle: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                      menuStyle: MenuStyle(
                        backgroundColor: const WidgetStatePropertyAll(Color(0xFF6A00D4)),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xFF6A00D4),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
                      ),
                      dropdownMenuEntries: AppConstants.postTypes.map((item) {
                        return DropdownMenuEntry<String>(
                          value: item["title"],
                          label: item["title"],
                          leadingIcon: Icon(item["icon"], color: Colors.white, size: 18),
                          style: MenuItemButton.styleFrom(foregroundColor: Colors.white),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ── text input ──────────────────────────────────
            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(hintText: config.hintText),
            ),

            const SizedBox(height: 16),

            // ── submit button ───────────────────────────────
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 42,
                child: ElevatedButton(
                  onPressed: config.onShared,
                  child: Text(config.buttonText, style: const TextStyle(fontSize: 12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}