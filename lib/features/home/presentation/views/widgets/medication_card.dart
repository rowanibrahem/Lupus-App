import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final String name;
  final String sub;
  final String dose;
  final String time;

  const MedicationCard({
    super.key,
    required this.name,
    required this.sub,
    required this.dose,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F0FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.medication, color: Colors.purple),
          ),

          const SizedBox(width: 10),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                Text(
                  sub,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.right,
                ),
                if (dose.isNotEmpty)
                  Text(
                    "قرص واحد $dose",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
              ],
            ),
          ),

          /// Time
          Text(
            time,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}