import 'package:flutter/material.dart';

class QuickActionMenu extends StatefulWidget {
  const QuickActionMenu({super.key});

  @override
  State<QuickActionMenu> createState() => _QuickActionMenuState();
}

class _QuickActionMenuState extends State<QuickActionMenu> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // The expanding container for secondary buttons
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutQuart,
          width: _isExpanded ? 180.0 : 0.0, // Fixed target width
          child: ClipRect(
            // SingleChildScrollView prevents Flutter from panicking when width shrinks to 0
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              reverse: true, // Keeps buttons anchored to the FAB side as it closes
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSecondaryAction(Icons.document_scanner_outlined, () {}),
                  const SizedBox(width: 12),
                  _buildSecondaryAction(Icons.edit_outlined, () {}),
                  const SizedBox(width: 12),
                  _buildSecondaryAction(Icons.credit_card_outlined, () {}),
                  const SizedBox(width: 12), // Spacing before the main button
                ],
              ),
            ),
          ),
        ),
        
        // The Primary Toggle Button
        SizedBox(
          width: 56,
          height: 56,
          child: FloatingActionButton(
            heroTag: 'quick_action_fab',
            onPressed: _toggleMenu,
            backgroundColor: const Color(0xFF00327D),
            elevation: _isExpanded ? 0 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: child.key == const ValueKey('close') 
                      ? Tween<double>(begin: -0.25, end: 0).animate(animation)
                      : Tween<double>(begin: 0.25, end: 0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: _isExpanded
                  ? const Icon(Icons.close_rounded, key: ValueKey('close'), color: Colors.white)
                  : const Icon(Icons.add_rounded, key: ValueKey('add'), color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryAction(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x15000000), 
            blurRadius: 8, 
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: const Color(0xFF00327D), size: 22),
        onPressed: onTap,
        constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      ),
    );
  }
}