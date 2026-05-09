import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBudgetCardInput extends StatelessWidget {
  const CategoryBudgetCardInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Card Base
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CATEGORY BUDGET',
                style: GoogleFonts.manrope(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF9E9E9E),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '\$',
                    style: GoogleFonts.manrope(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFBDBDBD),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '0.00',
                    style: GoogleFonts.manrope(
                      fontSize: 72,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF00327D),
                      letterSpacing: -2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // USD Badge positioned top-right
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF00327D),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), // Matches card corner
                bottomLeft: Radius.circular(16), // Distinct inner curve
              ),
            ),
            child: Text(
              'USD',
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}