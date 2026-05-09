import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconPickerSection extends StatelessWidget {
  const IconPickerSection({super.key});

  final List<IconData> _availableIcons = const [
    Icons.shopping_bag_outlined,
    Icons.home_outlined,
    Icons.directions_car_outlined,
    Icons.restaurant_outlined,
    Icons.bolt_outlined,
    Icons.medical_services_outlined,
    Icons.flight_outlined,
    Icons.movie_creation_outlined,
    Icons.fitness_center_outlined,
    Icons.pets_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Icon',
          style: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true, 
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, 
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _availableIcons.length,
          itemBuilder: (context, index) {
            // Hardcoding the first item as 'selected' just for the visual layout
            final isSelected = index == 0; 
            
            return Container(
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF00327D) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? const Color(0xFF00327D) : Colors.grey.shade200,
                ),
              ),
              child: Icon(
                _availableIcons[index],
                color: isSelected ? Colors.white : const Color(0xFF757575),
                size: 24,
              ),
            );
          },
        ),
      ],
    );
  }
}