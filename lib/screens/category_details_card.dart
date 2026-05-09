import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailsCard extends StatelessWidget {
  const CategoryDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
          // --- CATEGORY NAME ---
          Text(
            'CATEGORY NAME',
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF9E9E9E),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E1E1E),
            ),
            decoration: InputDecoration(
              hintText: 'John Doe',
              hintStyle: GoogleFonts.manrope(
                color: const Color(0xFFBDBDBD), 
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F7FA), // Light grey input background
              prefixIcon: const Icon(Icons.person_outline_rounded, color: Color(0xFF757575)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // Removes the default border
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // --- NOTES ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.notes_rounded, color: Color(0xFF757575), size: 20),
              const SizedBox(width: 12),
              Text(
                'NOTES',
                style: GoogleFonts.manrope(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF9E9E9E),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 32.0), // Aligns with the text above, skipping the icon
            child: TextFormField(
              maxLines: null, // Allows multiline
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E1E1E),
              ),
              decoration: InputDecoration(
                hintText: 'What was this for?',
                hintStyle: GoogleFonts.manrope(
                  color: const Color(0xFF9E9E9E), 
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none, // Completely flat text area
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}