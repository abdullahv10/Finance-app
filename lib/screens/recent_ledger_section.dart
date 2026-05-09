import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentLedgerSection extends StatelessWidget {
  const RecentLedgerSection({super.key});

  // Dummy transaction data
  final List<Map<String, dynamic>> _transactions = const [
    {'name': 'Apple Store', 'date': 'Oct 18, 3:45 PM', 'amount': -1299.00, 'icon': Icons.apple},
    {'name': 'Dividend Payout', 'date': 'Oct 17, 9:00 AM', 'amount': 450.25, 'icon': Icons.trending_up},
    {'name': 'The Gilded Fork', 'date': 'Oct 16, 8:30 PM', 'amount': -240.50, 'icon': Icons.restaurant},
    {'name': 'Spotify Premium', 'date': 'Oct 15, 10:00 AM', 'amount': -9.99, 'icon': Icons.music_note},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. The Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Recent Ledger',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E1E1E),
              ),
            ),
            Text(
              'VIEW ALL',
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF00327D), // Primary blue
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),

        // 2. The Transaction List
        ListView.builder(
          // ---> THE TWO MAGIC LINES <---
          shrinkWrap: true, 
          physics: const NeverScrollableScrollPhysics(), 
          
          itemCount: _transactions.length,
          itemBuilder: (context, index) {
            final tx = _transactions[index];
            final isPositive = tx['amount'] > 0;

            return Container(
              margin: const EdgeInsets.only(bottom: 16), // Space between rows
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03), // Super subtle shadow
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon Block
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(tx['icon'], color: const Color(0xFF00327D), size: 24),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Text Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx['name'],
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tx['date'],
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: const Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Amount (Changes color based on positive/negative)
                  Text(
                    '${isPositive ? '+' : '-'}\$${tx['amount'].abs().toStringAsFixed(2)}',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      // Green for money in, Red for money out
                      color: isPositive ? const Color(0xFF4CAF50) : const Color(0xFFE53935),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}