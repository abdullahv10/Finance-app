import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBudgetCard extends StatelessWidget {
  final String name;
  final double spent;
  final double total;
  final IconData icon;

  const CategoryBudgetCard({
    super.key,
    required this.name,
    required this.spent,
    required this.total,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (spent / total).clamp(0.0, 1.0);
    bool isOverBudget = spent > total;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isOverBudget ? const Color(0xFFFFEBEE) : const Color(0xFFE6F0FC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon, 
                  color: isOverBudget ? const Color(0xFFE53935) : const Color(0xFF00327D), 
                  size: 20
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1E1E1E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${spent.toStringAsFixed(0)} / \$${total.toStringAsFixed(0)}',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: const Color(0xFF757575),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (isOverBudget)
                Text(
                  'Over Budget',
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE53935), 
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: isOverBudget ? const Color(0xFFFFCDD2) : const Color(0xFFE6F0FC),
              valueColor: AlwaysStoppedAnimation<Color>(
                isOverBudget ? const Color(0xFFE53935) : const Color(0xFF00327D),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}