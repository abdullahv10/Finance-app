import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LedgerInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? prefixIcon;

  const LedgerInputField({
    super.key,
    required this.label,
    required this.hint,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E1E1E),
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.manrope(
              color: const Color(0xFF9E9E9E), 
              fontWeight: FontWeight.normal
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: prefixIcon != null 
                ? Icon(prefixIcon, color: const Color(0xFF9E9E9E), size: 20)
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00327D), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}