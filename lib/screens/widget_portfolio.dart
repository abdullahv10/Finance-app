import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioCard extends StatelessWidget {
  final String balance;
  final String percentageChange;

  const PortfolioCard({
    super.key,
    required this.balance,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // --- ADDED LINEAR GRADIENT ---
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF002B6B), // Darker rich blue at top left
            Color(0xFF0049A6), // Lighter vibrant blue at bottom right
          ],
        ),
        borderRadius: BorderRadius.circular(24), 
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00327D).withOpacity(0.3), 
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LIQUID WEALTH PORTFOLIO',
                style: GoogleFonts.manrope(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  // --- MADE BADGE BACKGROUND MORE SOLID ---
                  color: const Color(0xFF18668B), 
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  percentageChange, 
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF4ACDF9), 
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            balance, 
            style: GoogleFonts.manrope(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Market valuation as of today',
            style: GoogleFonts.manrope(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.15), 
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'DEPOSIT',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // --- UNIFIED BUTTON STYLE ---
                    backgroundColor: Colors.white.withOpacity(0.15), // Removed transparent background
                    elevation: 0,
                    // side: const BorderSide(color: Colors.white24, width: 1.5), <-- Removed border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'WITHDRAW',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}