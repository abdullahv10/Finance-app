import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

// ============================================================================
// 1. DATA MODELS (Backend Blueprints)
// Your API will populate these classes, and you will pass them to the widget.
// ============================================================================

class DailySpendModel {
  final int dayIndex; // 0 = Monday, 6 = Sunday
  final double amount; // The amount spent on this day (out of 100 for the chart scale)

  DailySpendModel({required this.dayIndex, required this.amount});
}

class SpendingVelocityData {
  final List<DailySpendModel> weeklyData;
  final double trendPercentage; // e.g., 12.4
  final bool isTrendDown; // true = less spending (good), false = more spending
  final double budgetRemaining; // e.g., 1240.00

  SpendingVelocityData({
    required this.weeklyData,
    required this.trendPercentage,
    required this.isTrendDown,
    required this.budgetRemaining,
  });
}

// ============================================================================
// 2. THE WIDGET (100% Dynamic UI)
// ============================================================================

class SpendingVelocitySection extends StatelessWidget {
  final SpendingVelocityData data; // Requires data to render!

  const SpendingVelocitySection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Format the budget remaining securely with commas for thousands
    final formattedBudget = '\$${data.budgetRemaining.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';

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
          // 1. Header & Trend Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spending Velocity',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Trend relative to baseline',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
              
              // Dynamic Trend Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: data.isTrendDown ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      data.isTrendDown ? Icons.trending_down_rounded : Icons.trending_up_rounded, 
                      color: data.isTrendDown ? const Color(0xFF2E7D32) : const Color(0xFFC62828), 
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${data.trendPercentage.toStringAsFixed(1)}%',
                      style: GoogleFonts.manrope(
                        color: data.isTrendDown ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // 2. The Dynamic Bar Chart
          SizedBox(
            height: 160, 
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100, // Background track fills to 100
                barTouchData: BarTouchData(enabled: false), 
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            days[value.toInt()],
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Map the backend data directly to the UI bars
                barGroups: data.weeklyData.map((dailySpend) {
                  return _makeBarData(dailySpend.dayIndex, dailySpend.amount);
                }).toList(),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // 3. Dynamic Budget Remaining Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBF9), 
              borderRadius: BorderRadius.circular(50), 
              border: Border.all(color: const Color(0xFFE8F5E9), width: 1.5), 
            ),
            child: Row(
              children: [
                const Icon(Icons.pie_chart_outline_rounded, color: Color(0xFF004D40), size: 20),
                const SizedBox(width: 8),
                Text(
                  'Budget Remaining',
                  style: GoogleFonts.manrope(fontSize: 14, color: const Color(0xFF1E1E1E), fontWeight: FontWeight.w600),
                ),
                const Spacer(), 
                Text(
                  formattedBudget, // Uses the dynamically formatted string
                  style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w800, color: const Color(0xFF004D40)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Internal helper for rendering the thick bars
  BarChartGroupData _makeBarData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF91B4DD), 
          width: 24, // Thicker bars as requested
          borderRadius: BorderRadius.circular(6), 
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100, 
            color: const Color(0xFFE6F0FC), 
          ),
        ),
      ],
    );
  }
}