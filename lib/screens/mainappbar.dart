import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // --- ADDED THIS LINE TO INCREASE HEIGHT ---
      toolbarHeight: 80.0, 
      
      backgroundColor: const Color(0xFFF3F5F7), 
      elevation: 0, 
      centerTitle: false, 
      
      // 1. The Profile Avatar (Left side)
      leadingWidth: 70, 
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
        ),
      ),
      
      // 2. The Main Title
      title: Text(
        'Sovereign Ledger',
        style: GoogleFonts.manrope(
          color: const Color(0xFF00327D), 
          fontWeight: FontWeight.w800,
          fontSize: 20, 
          letterSpacing: -1,
        ),
      ),
      
      // 3. The Notification Bell (Right side)
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                size: 25,
                Icons.notifications_none_rounded, 
                color: Color(0xFF00327D), 
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }

  // --- UPDATED THIS TO MATCH THE NEW TOOLBAR HEIGHT ---
  @override
  Size get preferredSize => const Size.fromHeight(70.0); 
}