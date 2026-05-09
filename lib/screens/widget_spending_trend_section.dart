import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // The new chart package!
import 'package:google_fonts/google_fonts.dart';

class SpendingTrendSection extends StatelessWidget {
  const SpendingTrendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240, // Fixed height for the chart card
      padding: const EdgeInsets.all(20),
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
          // Subtitle / Date Range
          Text(
            'Oct 1 - Oct 31, 2023',
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF9E9E9E),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // The Line Chart
          Expanded(
            child: LineChart(
              LineChartData(
                // 1. Hide the grid lines
                gridData: const FlGridData(show: false),
                
                // 2. Hide the outer borders
                borderData: FlBorderData(show: false),
                
                // 3. Setup the X-Axis Labels (Bottom)
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      interval: 2, // Space between labels
                      getTitlesWidget: (value, meta) {
                        String text = '';
                        switch (value.toInt()) {
                          case 0: text = 'OCT 1'; break;
                          case 2: text = 'OCT 8'; break;
                          case 4: text = 'OCT 15'; break;
                          case 6: text = 'OCT 22'; break;
                          case 8: text = 'OCT 31'; break;
                        }
                        return Text(
                          text,
                          style: GoogleFonts.manrope(
                            color: const Color(0xFF9E9E9E),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                // 4. The actual line and data points
                minX: 0,
                maxX: 8,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    // These numbers map out the curve from your design
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(2, 3.5),
                      FlSpot(4, 2.5),
                      FlSpot(6, 4.5),
                      FlSpot(8, 3.2),
                    ],
                    isCurved: true, // This makes the line smooth!
                    color: const Color(0xFF00327D), // Your primary blue
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false), // Hides the dots on the line
                    
                    // The nice blue gradient fade under the line
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF00327D).withOpacity(0.15),
                          const Color(0xFF00327D).withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}