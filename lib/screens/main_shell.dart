import 'package:finance_app/screens/insights_screen.dart';
import 'package:finance_app/screens/screen_budget.dart';
import 'package:finance_app/screens/screen_overview.dart';
import 'package:finance_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // 1. Track the current tab
  int _currentIndex = 0;

  // 2. Define the pages (you will create these screen files later)
  final List<Widget> _pages = [
    const OverviewScreen(), // Placeholder
    const BudgetsScreen(),
    const InsightsScreen(),
    const SettingsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // ---> THIS WAS THE MISSING PIECE! <---
  // It lives inside the class, but BEFORE the build method
  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return Container(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: () => _onTabTapped(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE6F0FC) : Colors.transparent,
            borderRadius: BorderRadius.circular(16), 
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xFF00327D) : const Color(0xFF9E9E9E),
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight:  FontWeight.bold ,
                  color: isSelected ? const Color(0xFF00327D) : const Color(0xFF9E9E9E),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light grey background
      
      // Shows the current page
      body: _pages[_currentIndex],


      // This container is your Bottom Nav Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
        decoration: const BoxDecoration(
          color: Colors.white,
          
          // ---> THIS CREATES THE EDGES EFFECT <---
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.space_dashboard, 'OVERVIEW', 0),
            _buildNavItem(Icons.account_balance_wallet_outlined, 'BUDGETS', 1),
            _buildNavItem(Icons.insights, 'INSIGHTS', 2),
            _buildNavItem(Icons.settings_outlined, 'SETTINGS', 3),
          ],
        ),
      ),

    );
  }
}