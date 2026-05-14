import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/label_dropdown_menu.dart';
import 'package:lupus_app/core/constants/app_text.dart';

class AuthCountryCityField extends StatelessWidget {
  const AuthCountryCityField({
    super.key,
    required this.selectedCountry,
    required this.selectedCity,
  });

  final ValueNotifier<String?> selectedCountry;
  final ValueNotifier<String?> selectedCity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<String?>(
            valueListenable: selectedCountry,
            builder: (context, country, _) {
              return LabelDropdownMenu<String>(
                label: AppText.country,
                leadingIcon: country == null ? null : Padding(padding: const EdgeInsets.all(16), child: CountryFlag.fromCountryCode(AppConstants.getCountryCode(country), width: 20, height: 20)),
                initialSelection: country,
                onSelected: (v) {
                  if (v == selectedCountry.value) return;
                  selectedCountry.value = v;
                  final cities = AppConstants.getCitiesForCountry(v);
                  selectedCity.value = cities.isNotEmpty ? cities.first : null;
                },
                dropdownMenuEntries: AppConstants.countries.map((c) => DropdownMenuEntry(value: c.name, label: c.name, leadingIcon: CountryFlag.fromCountryCode(c.code, width: 20, height: 20))).toList(),
              );
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ValueListenableBuilder<String?>(
            valueListenable: selectedCountry, // ← listen to country too
            builder: (context, country, _) {
              final cities = AppConstants.getCitiesForCountry(country);
              return ValueListenableBuilder<String?>(
                valueListenable: selectedCity,
                builder: (context, city, _) {
                  return LabelDropdownMenu<String>(
                    key: ValueKey(country), // ← recreate when country changes
                    label: AppText.city,
                    initialSelection: cities.contains(city) ? city : cities.firstOrNull,
                    onSelected: (v) => selectedCity.value = v,
                    dropdownMenuEntries: cities.map((c) => DropdownMenuEntry(value: c, label: c)).toList(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
