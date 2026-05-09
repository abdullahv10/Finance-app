import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentAdjustmentsSection extends StatelessWidget {
  const RecentAdjustmentsSection({super.key});

  final List<Map<String, dynamic>> _adjustments = const [
    {
      'title': 'Housing Utilities',
      'subtitle': 'Increased by +\$50.00',
      'time': 'TODAY',
      'icon': Icons.keyboard_double_arrow_up_rounded,
      'iconColor': Color(0xFF00327D),
      'bgColor': Color(0xFFE6F0FC),
    },
    {
      'title': 'Dining Out',
      'subtitle': 'Reduced by -\$100.00',
      'time': 'YESTERDAY',
      'icon': Icons.keyboard_double_arrow_down_rounded,
      'iconColor': Color(0xFF00327D),
      'bgColor': Color(0xFFE6F0FC),
    },
    {
      'title': 'Entertainment',
      'subtitle': 'Smart-Reallocated',
      'time': 'OCT 12',
      'icon': Icons.auto_fix_high_rounded,
      'iconColor': Color(0xFF00327D),
      'bgColor': Color(0xFFE6F0FC),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Allocation Adjustments',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _adjustments.length,
          itemBuilder: (context, index) {
            final adj = _adjustments[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: adj['bgColor'],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(adj['icon'], color: adj['iconColor'], size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adj['title'],
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          adj['subtitle'],
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    adj['time'],
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9E9E9E),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}