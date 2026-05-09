import 'package:finance_app/screens/othereappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Note: Make sure you import the secondary app bar we made earlier!
// import 'secondary_app_bar.dart'; 

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // State variables to toggle the eye icons
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background for forms
      
      // We reuse the custom back button app bar we built earlier!
      appBar: SecondaryAppBar(pageTitle: 'Password'),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F0FC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.restore_rounded, color: Color(0xFF00327D), size: 32),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Change Password',
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF00327D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Update your credentials to maintain strict account security and data protection.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: const Color(0xFF757575),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),

            // 2. Current Password Field
            _buildPasswordField(
              label: 'Current Password',
              hint: 'Enter current password',
              isObscured: _obscureCurrent,
              onToggle: () => setState(() => _obscureCurrent = !_obscureCurrent),
            ),

            const SizedBox(height: 24),

            // 3. New Password Field
            _buildPasswordField(
              label: 'New Password',
              hint: 'Pr3cisiOn!2024',
              isObscured: _obscureNew,
              onToggle: () => setState(() => _obscureNew = !_obscureNew),
            ),
            
            const SizedBox(height: 12),

            // 4. Password Strength Indicator
            Row(
              children: [
                Expanded(child: _buildStrengthBar(isActive: true)),
                const SizedBox(width: 4),
                Expanded(child: _buildStrengthBar(isActive: true)),
                const SizedBox(width: 4),
                Expanded(child: _buildStrengthBar(isActive: false)), // The empty grey bar
                const SizedBox(width: 12),
                Text(
                  'Strength:',
                  style: GoogleFonts.manrope(fontSize: 12, color: const Color(0xFF9E9E9E)),
                ),
                Text(
                  ' Strong',
                  style: GoogleFonts.manrope(
                    fontSize: 12, 
                    fontWeight: FontWeight.bold, 
                    color: const Color(0xFF00327D)
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 5. Security Requirements Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SECURITY REQUIREMENTS',
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF757575),
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildRequirementRow('At least 12 characters long'),
                  const SizedBox(height: 8),
                  _buildRequirementRow('Contains uppercase & lowercase letters'),
                  const SizedBox(height: 8),
                  _buildRequirementRow('Contains numbers or symbols'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 6. Confirm Password Field
            _buildPasswordField(
              label: 'Confirm New Password',
              hint: 'Pr3cisiOn!2024',
              isObscured: _obscureConfirm,
              onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
            ),

            const SizedBox(height: 40),

            // 7. Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00327D),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Text(
                  'Update Password',
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
                onPressed: () => Navigator.pop(context),
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

            const SizedBox(height: 24),

            // 8. Footer Secure text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline_rounded, color: Color(0xFF9E9E9E), size: 14),
                const SizedBox(width: 6),
                Text(
                  'Your connection is securely encrypted.',
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER METHODS ---

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required bool isObscured,
    required VoidCallback onToggle,
  }) {
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
          obscureText: isObscured,
          style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.manrope(color: const Color(0xFF9E9E9E), fontWeight: FontWeight.normal),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00327D), width: 2),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: const Color(0xFF9E9E9E),
              ),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStrengthBar({required bool isActive}) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF00327D) : const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildRequirementRow(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle_rounded, color: Color(0xFF00327D), size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.manrope(
            fontSize: 12,
            color: const Color(0xFF00327D),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}