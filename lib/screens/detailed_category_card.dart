import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double spent;
  final double left;
  final bool isWarning; // Turns the bar and text red

  const DetailedCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.spent,
    required this.left,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate progress for the bar
    final total = spent + left;
    final progress = total > 0 ? (spent / total).clamp(0.0, 1.0) : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Very light greyish-blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(icon, color: const Color(0xFF00327D), size: 16),
          ),
          const SizedBox(height: 16),
          
          // Title
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 8),
          
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(
                isWarning ? const Color(0xFFD32F2F) : const Color(0xFF00327D),
              ),
              minHeight: 4,
            ),
          ),
          const SizedBox(height: 12),
          
          // Bottom Amounts Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${spent.toStringAsFixed(0)}',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF00327D),
                ),
              ),
              Text(
                '\$${left.toStringAsFixed(0)} LEFT',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: isWarning ? const Color(0xFFD32F2F) : const Color(0xFF757575),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}