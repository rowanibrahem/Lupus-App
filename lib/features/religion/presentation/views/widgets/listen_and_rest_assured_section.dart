import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/religion/presentation/views/widgets/audio_play_button.dart';

class ListenAndRestAssuredSection extends StatelessWidget {
  const ListenAndRestAssuredSection(this.listenAndRest, {super.key});
  final Map<String, dynamic> listenAndRest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'استمع واطمئن', // !TODO:AppText
          onViewAll: () => Navigator.pushNamed(
            context,
            Routes.listenAndRelax,
            arguments: listenAndRest,
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: 2, // listenAndRest["mostListened"].length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) => _AudioCard(
              title: listenAndRest["mostListened"][index]['title'],
              subtitle: listenAndRest["mostListened"][index]['desc'],
              onTap: () {}, //!TODO: Audio_pop.up
            ),
          ),
        ),
      ],
    );
  }
}

// ── Audio Card ────────────────────────────────────────────
class _AudioCard extends StatelessWidget {
  const _AudioCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        children: [
          AudioPlayButton(onTap: onTap).paddingLeft(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Styles.text12BlackW700(context)).paddingBottom(3),
              Text(subtitle, style: Styles.text10GrayW500(context)),
            ],
          ),
          const Spacer(),
          SvgPicture.asset("assets/icons/audio.svg")
        ],
      ),
    );
  }
}
