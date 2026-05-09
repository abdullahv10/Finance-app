import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;

  const SecondaryAppBar({
    super.key,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF5F7FA), // App background color
      elevation: 0,
      centerTitle: false,
      
      // ---> THIS IS YOUR CUSTOM BACK BUTTON <---
      leadingWidth: 70, // Gives the button enough room so it isn't squished
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // White background for the button
            borderRadius: BorderRadius.circular(12), // Nice rounded corners
            border: Border.all(color: Colors.grey.shade200), // Subtle border
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded, // A modern iOS-style rounded arrow
              color: Color(0xFF00327D), // Your primary blue
              size: 20,
            ),
            onPressed: () {
              // This is the magic command that pops the current screen off the stack!
              Navigator.pop(context);
            },
          ),
        ),
      ),

      // ---> THE PAGE TITLE <---
      title: Text(
        pageTitle,
        style: GoogleFonts.manrope(
          color: const Color(0xFF00327D),
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}