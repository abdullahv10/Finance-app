import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_category_screen.dart'; // The screen we just built
import 'category_selection_screen.dart';

class CategoryCarouselSection extends StatelessWidget {
  const CategoryCarouselSection({super.key});

  final List<Map<String, dynamic>> _dummyCategories = const [
    {'name': 'Shop', 'icon': Icons.shopping_bag_outlined},
    {'name': 'Home', 'icon': Icons.home_outlined},
    {'name': 'New', 'icon': Icons.add},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CATEGORY',
            style: GoogleFonts.manrope(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF9E9E9E),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _dummyCategories.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _dummyCategories[index];
                final isNewButton = item['name'] == 'New';

                // --- NAVIGATION LOGIC MOVED HERE ---
                return GestureDetector(
                  onTap: () {
                    if (isNewButton) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateCategoryScreen(), 
                        ),
                      );
                    } else {
                      // Logic for tapping an existing category (e.g., 'Shop' or 'Home')
                      // can go here later.
                    }
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: isNewButton ? const Color(0xFFE6F0FC) : const Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item['icon'], 
                          color: isNewButton ? const Color(0xFF00327D) : const Color(0xFF757575),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['name'],
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isNewButton ? const Color(0xFF00327D) : const Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              // Cleared this out so we can use it for the REAL "Add Category" screen next
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategorySelectionScreen(),
                  ),
                );
              }, 
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
              label: Text(
                'Add New Category',
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00327D),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}