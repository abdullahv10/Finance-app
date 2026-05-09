import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailed_category_card.dart';
import 'dashed_create_category_button.dart';
// Import the form screen we built previously to link to the bottom button
// import 'create_category_screen.dart'; 

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  final List<Map<String, dynamic>> _existingCategories = const [
    {'icon': Icons.restaurant_menu_rounded, 'title': 'Utilities', 'spent': 150.0, 'left': 100.0, 'isWarning': true},
    {'icon': Icons.directions_car_rounded, 'title': 'Entertainment', 'spent': 200.0, 'left': 100.0, 'isWarning': false},
    {'icon': Icons.directions_car_rounded, 'title': 'Groceries', 'spent': 250.0, 'left': 75.0, 'isWarning': false},
    {'icon': Icons.restaurant_menu_rounded, 'title': 'Transportation', 'spent': 100.0, 'left': 50.0, 'isWarning': true},
    {'icon': Icons.directions_car_rounded, 'title': 'Health & Fitness', 'spent': 120.0, 'left': 30.0, 'isWarning': false},
    {'icon': Icons.directions_car_rounded, 'title': 'Clothing', 'spent': 180.0, 'left': 50.0, 'isWarning': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Color(0x05000000), blurRadius: 5, offset: Offset(0, 2))
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF00327D), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'New Category',
          style: GoogleFonts.manrope(
            color: const Color(0xFF00327D),
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _existingCategories.length,
                itemBuilder: (context, index) {
                  final cat = _existingCategories[index];
                  return DetailedCategoryCard(
                    icon: cat['icon'],
                    title: cat['title'],
                    spent: cat['spent'],
                    left: cat['left'],
                    isWarning: cat['isWarning'],
                  );
                },
              ),
              const SizedBox(height: 16),
              DashedCreateCategoryButton(
                onTap: () {
                  // This is where you connect to the actual input form we built earlier!
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateCategoryScreen()));
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}