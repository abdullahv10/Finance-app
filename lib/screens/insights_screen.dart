import 'package:finance_app/screens/budgets_section.dart';
import 'package:finance_app/screens/mainappbar.dart';
import 'package:finance_app/screens/widget_spending_velocity_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------- //
// 1. THE MAIN INSIGHTS SCREEN SHELL
// ---------------------------------------------------------------- //
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Main Title
            Text(
              'Financial Insights',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF00327D), // Primary Blue
              ),
            ),
            const SizedBox(height: 24),
      
            // 2. The Timeframe Toggle (Daily/Weekly/Monthly)
            const TimeframeToggle(),
            
            const SizedBox(height: 32),
      
            // --- PLACEHOLDERS FOR OUR NEXT LEGO BLOCKS --- //
            
            SpendingVelocitySection(
              data: SpendingVelocityData(
                trendPercentage: 12.4,
                isTrendDown: true, // Automatically makes the badge green
                budgetRemaining: 1240.00,
                weeklyData: [
                  DailySpendModel(dayIndex: 0, amount: 40),
                  DailySpendModel(dayIndex: 1, amount: 75),
                  DailySpendModel(dayIndex: 2, amount: 50),
                  DailySpendModel(dayIndex: 3, amount: 90),
                  DailySpendModel(dayIndex: 4, amount: 60),
                  DailySpendModel(dayIndex: 5, amount: 85),
                  DailySpendModel(dayIndex: 6, amount: 35),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            const BudgetsSection(),
            const SizedBox(height: 40),
  
            
            const SizedBox(height: 100), // Safe space for bottom nav bar
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- //
// 2. THE CUSTOM TIMEFRAME TOGGLE WIDGET
// ---------------------------------------------------------------- //
// This is Stateful because it needs to remember which button is clicked
class TimeframeToggle extends StatefulWidget {
  const TimeframeToggle({super.key});

  @override
  State<TimeframeToggle> createState() => _TimeframeToggleState();
}

class _TimeframeToggleState extends State<TimeframeToggle> {
  // 2 means 'Monthly' is selected by default (Index 0, 1, 2)
  int _selectedIndex = 2; 
  final List<String> _options = ['Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA), // Light grey background matching app
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        // List.generate dynamically creates our 3 buttons
        children: List.generate(_options.length, (index) {
          final isSelected = _selectedIndex == index;
          
          return Expanded(
            child: GestureDetector(
              // When tapped, update the state to the new index
              onTap: () => setState(() => _selectedIndex = index),
              
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  // White pill background if selected, transparent if not
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  // Add a subtle drop shadow only to the selected pill
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    _options[index],
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                      // Blue text if selected, Grey if not
                      color: isSelected ? const Color(0xFF00327D) : const Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}