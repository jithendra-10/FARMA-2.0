import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../chat/assistant_chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme-aware colors
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color surfaceColor = Theme.of(context).cardColor;
    final Color primaryActionColor = isDarkMode ? const Color(0xFF00D95F) : Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: _buildHeader(context, isDarkMode),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 16),
          _buildPrimaryActionCard(context, primaryActionColor),
          const SizedBox(height: 24),
          _buildSectionTitle('Continue where you left off'),
          const SizedBox(height: 12),
          _buildContinueAdviceCard(context, surfaceColor),
          const SizedBox(height: 24),
          _buildSectionTitle('Quick Actions'),
          const SizedBox(height: 12),
          _buildQuickActionItems(context, surfaceColor),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, isDarkMode),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDarkMode) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Farmer John',
              style: GoogleFonts.lexend(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Anantapur, Andhra Pradesh',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
            const SizedBox(height: 12),
            Chip(
              label: const Text('Kharif Season', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00D95F))),
              backgroundColor: isDarkMode ? const Color(0xFF1A2C22) : const Color(0xFFE0FADD),
              side: BorderSide.none,
              avatar: const Icon(Icons.grass, color: Color(0xFF00D95F), size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrimaryActionCard(BuildContext context, Color primaryColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AssistantChatScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.mic, color: Theme.of(context).scaffoldBackgroundColor, size: 28),
            const SizedBox(height: 12),
            Text(
              'Ask FARMA for crop advice',
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Get crop recommendations for your land',
              style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildContinueAdviceCard(BuildContext context, Color surfaceColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last advice: Cotton', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Recommended 2 hours ago', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Chip(
            label: const Text('Medium Risk', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.orange.shade400,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionItems(BuildContext context, Color surfaceColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _quickActionItem(icon: Icons.book_outlined, label: 'Crop Guide'),
          _quickActionItem(icon: Icons.warning_amber_rounded, label: 'Risk Alerts'),
          _quickActionItem(icon: Icons.compare_arrows, label: 'What-If'),
        ],
      ),
    );
  }

  Widget _quickActionItem({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.grey[400]),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isDarkMode) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDarkMode ? const Color(0xFF0D1C13) : Colors.white,
      selectedItemColor: isDarkMode ? const Color(0xFF00D95F) : Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey[500],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.mic_none), label: 'Ask FARMA'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
