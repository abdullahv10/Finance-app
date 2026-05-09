import 'package:finance_app/screens/change_password_screen.dart';
import 'package:finance_app/screens/mainappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'identity_verification_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State variable to control the Biometrics toggle switch
  bool _isBiometricsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // 1. Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFFE6F0FC),
                    child: Icon(Icons.person, color: Color(0xFF00327D), size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Faizan', // Set up ready for your profile
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.verified, color: Color(0xFF4CAF50), size: 14),
                            const SizedBox(width: 4),
                            Text(
                              'PRO MEMBER',
                              style: GoogleFonts.manrope(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF00327D),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: Color(0xFF9E9E9E)),
                ],
              ),
            ),
      
            const SizedBox(height: 24),
      
            // 2. Quick Action Cards (Row)
            Row(
              children: [
                Expanded(child: _buildQuickActionCard('Default Ledger', 'Main Savings', false)),
                const SizedBox(width: 16),
                Expanded(child: _buildQuickActionCard('Upgrade to', 'Sovereign Executive', true)),
              ],
            ),
      
            const SizedBox(height: 32),
      
            // 3. SECURITY & ACCESS Section
            _buildSectionTitle('SECURITY & ACCESS'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildSettingsTile(
                  icon: Icons.fingerprint_rounded,
                  title: 'Biometrics',
                  subtitle: 'FaceID or TouchID Enabled',
                  trailing: Switch(
                    value: _isBiometricsEnabled,
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF4CAF50), 
                    
                    // --> THE NEW ASYNC LOGIC <--
                    onChanged: (value) async {
                      if (value == true) {
                        // 1. User wants to turn it ON. We push the screen and WAIT for the answer.
                        final bool? verificationSuccess = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IdentityVerificationScreen(),
                          ),
                        );

                        // 2. Did they verify successfully?
                        if (verificationSuccess == true) {
                          setState(() {
                            _isBiometricsEnabled = true; // Turn it on!
                          });
                        } else {
                          // They hit Cancel, or swiped away. Keep it off.
                          setState(() {
                            _isBiometricsEnabled = false; 
                          });
                        }
                      } else {
                        // User just wants to turn it OFF. No verification needed.
                        setState(() {
                          _isBiometricsEnabled = false;
                        });
                      }
                    },
                  ),
                ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                _buildSettingsTile(
                    icon: Icons.password_rounded,
                    title: 'User Password',
                    subtitle: 'Last updated 5 days ago',
                    onTap: () {
                      // THIS is how you slide a new page over the main shell!
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: 32),
      
            // 4. PREFERENCES Section
            _buildSectionTitle('PREFERENCES'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildSettingsTile(icon: Icons.payments_outlined, title: 'Currency', subtitle: 'USD (\$)'),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                  _buildSettingsTile(icon: Icons.language_rounded, title: 'Language', subtitle: 'English (US)'),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                  _buildSettingsTile(icon: Icons.help_outline_rounded, title: 'Help Center', subtitle: 'FAQs and direct support'),
                ],
              ),
            ),
      
            const SizedBox(height: 32),
      
            // 5. Sign Out Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, color: Color(0xFFE53935)), // Red icon
                label: Text(
                  'Sign Out',
                  style: GoogleFonts.manrope(
                    color: const Color(0xFFE53935), // Red text
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDECEA), // Light red background
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
      
            const SizedBox(height: 24),
      
            // 6. Version Info
            Center(
              child: Text(
                'SOVEREIGN LEDGER V2.4.0',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF9E9E9E),
                  letterSpacing: 1,
                ),
              ),
            ),
            
            const SizedBox(height: 100), // Safe space for nav bar
          ],
        ),
      ),
    );
  }

  // --- HELPER METHODS TO KEEP CODE CLEAN ---

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF9E9E9E),
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildQuickActionCard(String subtitle, String title, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF00327D) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isDark ? Icons.auto_awesome : Icons.account_balance_wallet_outlined,
            color: isDark ? Colors.white : const Color(0xFF00327D),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: GoogleFonts.manrope(
              fontSize: 10,
              color: isDark ? Colors.white70 : const Color(0xFF757575),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF1E1E1E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF00327D), size: 20),
      ),
      title: Text(
        title,
        style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1E1E1E),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.manrope(
          fontSize: 12,
          color: const Color(0xFF9E9E9E),
        ),
      ),
      // If trailing is provided (like the Switch), use it. Otherwise, show an arrow.
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded, color: Color(0xFF9E9E9E)),
    );
  }
}