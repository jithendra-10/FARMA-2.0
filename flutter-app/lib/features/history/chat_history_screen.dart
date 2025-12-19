import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../advisory/advisory_screen.dart';
import '../market/marketplace_screen.dart';
import '../chat/assistant_chat_screen.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = theme.primaryColor;
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;
    final containerColor = isDark ? const Color(0xFF1c2e20) : Colors.white;
    final borderColor = theme.dividerColor.withOpacity(0.1);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
                      ),
                      child: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Chat History',
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildHistoryItem(
                    context,
                    title: "Tomato Disease Analysis",
                    date: "Today, 10:30 AM",
                    preview: "The yellow spots indicate early blight...",
                    isActive: true,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),
                  _buildHistoryItem(
                    context,
                    title: "Fertilizer for Corn",
                    date: "Yesterday",
                    preview: "Recommended NPK 20-20-20 for better growth...",
                    isActive: false,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),
                   _buildHistoryItem(
                    context,
                    title: "Weather Inquiry",
                    date: "Dec 15",
                    preview: "Heavy rain expected next week. Prepare drainage...",
                    isActive: false,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),
                   _buildHistoryItem(
                    context,
                    title: "Pest Control - Cotton",
                    date: "Dec 10",
                    preview: "Use Neem oil spray every 3 days...",
                    isActive: false,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHistoryItem(BuildContext context, {
    required String title,
    required String date,
    required String preview,
    required bool isActive,
    required bool isActive,
    required Color textColor,
    required Color containerColor,
    required Color borderColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        // In a real app, pass the conversation ID here
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AssistantChatScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? const Color(0xFF13EC6A).withOpacity(0.5) : borderColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withOpacity(0.05) : Colors.green.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.chat_bubble_outline, color: Color(0xFF13EC6A)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: GoogleFonts.lexend(fontWeight: FontWeight.bold, color: textColor, fontSize: 16)),
                      Text(date, style: GoogleFonts.lexend(color: isDark ? Colors.grey : Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(preview, style: GoogleFonts.lexend(color: isDark ? Colors.grey[400] : Colors.grey[600], fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(left: 8),
                height: 8, width: 8,
                decoration: const BoxDecoration(color: Color(0xFF13EC6A), shape: BoxShape.circle),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final navBg = isDark ? const Color(0xFF0D1C13).withOpacity(0.9) : Colors.white;
    const primaryColor = Color(0xFF13EC6A);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Reduced horizontal padding to fit 5 items
      decoration: BoxDecoration(
        color: navBg,
        border: Border(top: BorderSide(color: isDark ? Colors.white10 : Colors.black12)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context, Icons.home, 'Home', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))),
          _buildNavItem(context, Icons.spa, 'Guide', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CropGuideScreen()))),
          // History (Middle)
           _buildNavItem(context, Icons.history, 'History', true, primaryColor),
          _buildNavItem(context, Icons.tips_and_updates, 'Advisory', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdvisoryScreen()))),
          _buildNavItem(context, Icons.store, 'Market', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MarketplaceScreen()))),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isSelected, Color color, {VoidCallback? onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected) 
            Container(height: 6, width: 6, margin: const EdgeInsets.only(bottom: 2), decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color, blurRadius: 6)])),
          Icon(icon, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[400]), size: 24), // Slightly smaller icon
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[600]))),
        ],
      ),
    );
  }
}
