import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'verification_successful_screen.dart'; // Make sure this file exists!

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  bool _isVerifying = false; 

  void _startVerification() async {
    setState(() {
      _isVerifying = true; // Start the loading spinner
    });

    // Wait 2 seconds to simulate the camera processing
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isVerifying = false; // Stop the spinner
      });

      // Navigate to the Success screen and wait for the user to click "Go to Dashboard"
      final bool? isComplete = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerificationSuccessfulScreen(),
        ),
      );

      // If they clicked the dashboard button (which passes 'true'), 
      // we immediately pop THIS screen too, sending 'true' all the way back to Settings!
      if (isComplete == true && mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(), 

              // 1. Top Icon & Header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.face_retouching_natural_rounded, 
                  color: Color(0xFF00327D), 
                  size: 28,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Identity Verification',
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF00327D),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We need to perform a quick liveness check.\nCenter your face in the frame.',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: const Color(0xFF757575),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 48),

              // 2. The Camera Placeholder Circle
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE6F0FC), // Light blue background
                  border: Border.all(
                    color: const Color(0xFF00327D), // Thick blue border
                    width: 6,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.videocam_outlined,
                    color: const Color(0xFF00327D).withOpacity(0.3),
                    size: 64,
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // 3. Encrypted Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_outline_rounded, color: Color(0xFF9E9E9E), size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'End-to-end encrypted',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFF9E9E9E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(), 

              // 4. Action Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isVerifying ? null : _startVerification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00327D),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: _isVerifying
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Text(
                          'Start Verification ->',
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: 8),
              
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _isVerifying ? null : () => Navigator.pop(context, false),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFF00327D),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}