import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class LabelDropdownMenu<T> extends StatelessWidget {
  final String label;
  final T? initialSelection;
  final ValueChanged<T?>? onSelected;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final Widget? leadingIcon; // Added for the City icon
  final double? width;

  const LabelDropdownMenu({
    super.key,
    required this.label,
    required this.dropdownMenuEntries,
    this.initialSelection,
    this.onSelected,
    this.leadingIcon,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        DropdownMenu<T>(
          width: width,
          initialSelection: initialSelection,
          leadingIcon: leadingIcon, // Displays the icon on the left
          onSelected: onSelected,
          trailingIcon: const Icon(Icons.keyboard_arrow_down),
          selectedTrailingIcon: Icon(Icons.keyboard_arrow_up),
          dropdownMenuEntries: dropdownMenuEntries,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }
}
