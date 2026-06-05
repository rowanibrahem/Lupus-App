import 'package:flutter/material.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/contribution_card.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/financial_support_card.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/medicine_card.dart';

class ActivitiesTabList extends StatelessWidget {
  const ActivitiesTabList({
    super.key,
    required ValueNotifier<int> selectedTab,
    required this.community,
  }) : _selectedTab = selectedTab;
  
  final ValueNotifier<int> _selectedTab;
  final Map<String, dynamic> community;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedTab,
      builder: (context, selected, _) {
        return Expanded(
          child: switch (selected) {
            0 => _buildFinancialSupports(),
            1 => _buildContributions(),
            _ => _buildMedicines(),
          },
        );
      },
    );
  }

  Widget _buildMedicines() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: community['medicines'].length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final medicine = community['medicines'][index];
        return MedicineCard(medicine);
      },
    );
  }

  Widget _buildContributions() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: community['contributions'].length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final contribute = community['contributions'][index];
        return ContributionCard(contribute);
      },
    );
  }

  Widget _buildFinancialSupports() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: community['financialSupports'].length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final financialSupport = community['financialSupports'][index];
        return FinancialSupportCard(financialSupport);
      },
    );
  }
}
