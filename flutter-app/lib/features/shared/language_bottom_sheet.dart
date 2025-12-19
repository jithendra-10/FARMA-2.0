import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const LanguageBottomSheet(),
  );
}

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = isDark ? const Color(0xFF102217) : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Language',
                style: GoogleFonts.lexend(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: textColor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildLanguageOption(context, 'English', 'Default', true, textColor),
          const SizedBox(height: 12),
          _buildLanguageOption(context, 'Hindi (हिन्दी)', 'Coming Soon', false, textColor),
          const SizedBox(height: 12),
          _buildLanguageOption(context, 'Telugu (తెలుగు)', 'Coming Soon', false, textColor),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String name, String status, bool isSelected, Color textColor) {
    const Color primaryColor = Color(0xFF13EC6A);
    
    return GestureDetector(
      onTap: () {
        if (isSelected) Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: primaryColor)
            else
              Text(
                status,
                style: GoogleFonts.lexend(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
