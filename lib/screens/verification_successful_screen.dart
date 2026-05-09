import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationSuccessfulScreen extends StatelessWidget {
  const VerificationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light grey background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. The Main Floating Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                // ClipRRect ensures the top blue strip perfectly hugs the rounded corners
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    children: [
                      // The elegant blue gradient strip at the top
                      Container(
                        height: 6,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF23B6E6), Color(0xFF00327D)], // Light blue to dark blue
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            // 2. Success Icon
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Color(0xFFE6F0FC),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_circle_rounded, 
                                color: Color(0xFF00327D), 
                                size: 40,
                              ),
                            ),
                            
                            const SizedBox(height: 24),
                            
                            // 3. Text Content
                            Text(
                              'Verification Successful',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF1E1E1E),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Connecting to your account securely...',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                color: const Color(0xFF757575),
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // 4. Loading Bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const LinearProgressIndicator(
                                value: 0.4, // Fake progress for visual effect
                                backgroundColor: Color(0xFFE6F0FC),
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00327D)),
                                minHeight: 6,
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // 5. Action Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Pass 'true' back up the chain to indicate success!
                                  Navigator.pop(context, true);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00327D),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Go to Dashboard ->',
                                  style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 6. Security Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_outline_rounded, color: Color(0xFF9E9E9E), size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'Secured by Enterprise Grade Encryption',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFF9E9E9E),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}