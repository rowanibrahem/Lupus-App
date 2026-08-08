import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class DonationMethodsView extends StatefulWidget {
  const DonationMethodsView({super.key});

  @override
  State<DonationMethodsView> createState() => _DonationMethodsViewState();
}

class _DonationMethodsViewState extends State<DonationMethodsView> {
  final ValueNotifier<int> _selectedMethod = ValueNotifier(0);

  final List<_PaymentMethod> _methods = const [
    _PaymentMethod(
      title: 'Credit Card',
      subtitle: '+23******56',
      icon: _PaymentIcon.visa,
    ),
    _PaymentMethod(
      title: 'Vodafone-Cash',
      subtitle: null,
      icon: _PaymentIcon.vodafone,
    ),
  ];

  @override
  void dispose() {
    _selectedMethod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'طرق التبرع'),
      body: Column(
        children: [
          // ── Payment Methods ────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ValueListenableBuilder<int>(
                valueListenable: _selectedMethod,
                builder: (context, selected, _) {
                  return Column(
                    children: List.generate(
                      _methods.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _PaymentMethodCard(
                          method: _methods[index],
                          isSelected: selected == index,
                          onTap: () => _selectedMethod.value = index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ── Confirm Button ─────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ActivitiesView(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'تأكيد',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Payment Method Card ───────────────────────────────────
class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  final _PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: Styles.customCardBoxDecoration.copyWith(
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // ── radio ──────────────────────────────
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor : AppColors.grayColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 14),

            // ── title + subtitle ───────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    method.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  if (method.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      method.subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(width: 12),

            // ── payment icon ───────────────────────
            _buildPaymentIcon(method.icon),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentIcon(_PaymentIcon icon) {
    switch (icon) {
      case _PaymentIcon.visa:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F71),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'VISA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        );

      case _PaymentIcon.vodafone:
        return Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(Icons.attach_money_rounded, color: Colors.white, size: 22),
          ),
        );
    }
  }
}

// ── Models ────────────────────────────────────────────────
class _PaymentMethod {
  final String title;
  final String? subtitle;
  final _PaymentIcon icon;

  const _PaymentMethod({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

enum _PaymentIcon { visa, vodafone }
