import 'package:finance_app/screens/mainappbar.dart';
import 'package:flutter/material.dart';

import 'widget_monthly_burn.dart';
import 'widget_spending_velocity_section.dart'; // Reusing your existing block
import 'category_carousel_section.dart';
import 'recent_adjustments_section.dart';
import 'quick_add_allocation_card.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0, bottom: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthlyBurnCard(),
            SizedBox(height: 24),
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
            SizedBox(height: 24),
            CategoryCarouselSection(),
            SizedBox(height: 32),
            RecentAdjustmentsSection(),
            SizedBox(height: 32),
            QuickAddAllocationCard(),
          ],
        ),
      ),
    );
  }
}