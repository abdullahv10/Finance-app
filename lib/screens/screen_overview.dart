import 'package:finance_app/screens/mainappbar.dart';
import 'package:finance_app/screens/quick_action_menu.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/allocations_section.dart';
import 'package:finance_app/screens/widget_portfolio.dart';
import 'package:finance_app/screens/recent_ledger_section.dart';
import 'package:finance_app/screens/widget_spending_trend_section.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Transparent background so the MainShell color shows through
      backgroundColor: Colors.transparent, 
      appBar: MainAppBar(),
      
      // Note: No 'appBar' here! MainShell handles it.

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Portfolio Block
            const PortfolioCard(balance: '\$42,950.40', percentageChange: '+12.5%'),
            const SizedBox(height: 32),
            
            // 2. Allocations Block (Header is already inside this widget)
            const AllocationsSection(), 
            const SizedBox(height: 32),
      
            // 3. Spending Trend Block (Header flutis already inside this widget)
            const SpendingTrendSection(), 
            const SizedBox(height: 32),
      
            // 4. Recent Ledger Block (Header is already inside this widget)
            const RecentLedgerSection(), 
      
            const SizedBox(height: 100), // Safe space for bottom nav
          ],
        ),
      ),
      floatingActionButton: QuickActionMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}