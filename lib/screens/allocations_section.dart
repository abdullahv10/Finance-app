import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------- //
// 1. REUSABLE SECTION HEADER (Title + Optional "View All" button)
// ---------------------------------------------------------------- //
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText; // Nullable, in case a section doesn't have a button
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF00327D), // Primary blue
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- //
// 2. THE MAIN HORIZONTAL LIST SECTION
// ---------------------------------------------------------------- //
class AllocationsSection extends StatelessWidget {
  const AllocationsSection({super.key});

  // Dummy data representing what would eventually come from a database
  final List<Map<String, dynamic>> _allocations = const [
    {'title': 'Transport', 'spent': 320.0, 'total': 400.0, 'icon': Icons.directions_car_outlined},
    {'title': 'Dining Out', 'spent': 465.0, 'total': 500.0, 'icon': Icons.restaurant_outlined},
    {'title': 'Groceries', 'spent': 250.0, 'total': 600.0, 'icon': Icons.shopping_bag_outlined},
    {'title': 'Utilities', 'spent': 150.0, 'total': 200.0, 'icon': Icons.bolt_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Using our new reusable header
        SectionHeader(
          title: 'Allocations',
          actionText: 'View All',
          onActionTap: () {
            // Logic to open full allocations page later
          },
        ),
        const SizedBox(height: 16),
        
        // The magic horizontal scroll!
        // We MUST wrap a horizontal ListView in a SizedBox to give it a fixed height.
        SizedBox(
          height: 160, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _allocations.length,
            // Removes the annoying glow effect when hitting the edge on Android
            physics: const BouncingScrollPhysics(), 
            // Allows the cards to slide all the way to the edge of the screen
            clipBehavior: Clip.none, 
            itemBuilder: (context, index) {
              final item = _allocations[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0), // Space between cards
                child: AllocationCard(
                  title: item['title'],
                  amountSpent: item['spent'],
                  totalBudget: item['total'],
                  icon: item['icon'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- //
// 3. THE INDIVIDUAL ALLOCATION CARD
// ---------------------------------------------------------------- //
// ---------------------------------------------------------------- //
// 3. THE INDIVIDUAL ALLOCATION CARD
// ---------------------------------------------------------------- //
class AllocationCard extends StatelessWidget {
  final String title;
  final double amountSpent;
  final double totalBudget;
  final IconData icon;

  const AllocationCard({
    super.key,
    required this.title,
    required this.amountSpent,
    required this.totalBudget,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage for the progress bar safely
    double progress = (amountSpent / totalBudget).clamp(0.0, 1.0);
    double amountLeft = totalBudget - amountSpent;
    
    // --- NEW LOGIC: Warning state triggers at 80% capacity ---
    bool isWarning = progress >= 0.8;
    // We still need to know if they are actually over budget for the text label
    bool isOverBudget = amountLeft < 0; 

    return Container(
      width: 140, // Fixed width so they look like uniform cards
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // A very subtle, elegant shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon inside a light grey rounded box
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF00327D), size: 20),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 0, 0, 0), // Grey text
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Adds "..." if name is too long
              ),
              const SizedBox(height: 2),
              Text(
                '\$${amountSpent.toStringAsFixed(0)}', // Removes decimals
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF00327D), // Dark text
                ),
              ),
            ],
          ),
          
          // Progress Bar and Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  // --- NEW LOGIC: Darker background for visibility ---
                  backgroundColor: const Color(0xFFE2E8F0),
                  
                  // --- NEW LOGIC: Turns red if >= 80% ---
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isWarning ? const Color(0xFFD32F2F) : const Color(0xFF00327D),
                  ),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                isOverBudget 
                    ? '\$${amountLeft.abs().toStringAsFixed(0)} OVER' 
                    : '\$${amountLeft.toStringAsFixed(0)} LEFT',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  // --- NEW LOGIC: Text turns red if >= 80% ---
                  color: isWarning ? const Color(0xFFD32F2F) : const Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}