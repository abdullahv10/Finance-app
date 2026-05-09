import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetsSection extends StatelessWidget {
  const BudgetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header & Description
          Text(
            'September Budgets',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "You've utilized 68% of your total monthly allowance. Your trajectory suggests you'll remain within limits by month-end.",
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF757575),
              height: 1.5, // Better line spacing for readability
            ),
          ),
          
          const SizedBox(height: 24),

          // 2. Total Spent & Progress Bar
          Text(
            'Total Spent',
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF9E9E9E),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$4,280.00',
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF00327D), // Primary blue
                ),
              ),
              Text(
                'Budget Remaining: \$1,240.00',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF757575),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.68, // 68% filled
              backgroundColor: Color(0xFFE6F0FC),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00327D)),
              minHeight: 8,
            ),
          ),
          
          const SizedBox(height: 32),

          // 3. Allocations Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Allocation',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E1E1E),
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF00327D),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),

          // 4. The Donut Chart & Legend Row
          Row(
            children: [
              // Left Side: The Donut Chart (Wrapped in a Stack to put text in center)
              SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2, // Tiny gap between slices
                        centerSpaceRadius: 40, // The size of the donut hole
                        startDegreeOffset: -90,
                        sections: [
                          _buildPieSection(32, const Color(0xFF00327D)), // Transport
                          _buildPieSection(28, const Color(0xFF23B6E6)), // Dining
                          _buildPieSection(20, const Color(0xFF91B4DD)), // Groceries
                          _buildPieSection(20, const Color(0xFFE6F0FC)), // Utilities
                        ],
                      ),
                    ),
                    // The text inside the donut hole
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '68%',
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1E1E1E),
                          ),
                        ),
                        Text(
                          'Used',
                          style: GoogleFonts.manrope(
                            fontSize: 10,
                            color: const Color(0xFF9E9E9E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 32),
              
              // Right Side: The Legend
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendItem(const Color(0xFF00327D), 'Transport', '32%'),
                    const SizedBox(height: 12),
                    _buildLegendItem(const Color(0xFF23B6E6), 'Dining Out', '28%'),
                    const SizedBox(height: 12),
                    _buildLegendItem(const Color(0xFF91B4DD), 'Groceries', '20%'),
                    const SizedBox(height: 12),
                    _buildLegendItem(const Color(0xFFE6F0FC), 'Utilities', '20%'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to keep chart code clean
  PieChartSectionData _buildPieSection(double value, Color color) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '', // We hide titles on the chart itself because we have a legend
      radius: 16, // Thickness of the donut ring
    );
  }

  // Helper method to build the little colored dots and text for the legend
  Widget _buildLegendItem(Color color, String title, String percentage) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF757575),
            ),
          ),
        ),
        Text(
          percentage,
          style: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
          ),
        ),
      ],
    );
  }
}