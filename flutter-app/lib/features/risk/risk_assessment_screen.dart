import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../advisory/advisory_screen.dart';
import '../profile/profile_screen.dart';
import '../history/chat_history_screen.dart';
import '../market/marketplace_screen.dart';

class RiskAssessmentScreen extends StatelessWidget {
  const RiskAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Styles matching design
    const Color primaryColor = Color(0xFF13EC6A);
    const Color backgroundDark = Color(0xFF102217);
    const Color surfaceDark = Color(0xFF1C2E24);
    const Color textSecondary = Color(0xFF8BA898);

    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Back Button could be added here if this is pushed from CropPlanScreen
                       GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Risk Assessment',
                        style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48, height: 48,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic, color: Colors.black),
                  ),
                ],
              ),
            ),
            
            // Meta Text
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Last updated: Today, 8:00 AM',
                style: TextStyle(color: textSecondary, fontSize: 13),
              ),
            ),

            // Scrollable Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Weather Risk Card (Low)
                  _buildRiskCard(
                    title: 'Weather',
                    description: 'Good rain predicted for planting week. Soil moisture is optimal.',
                    riskLevel: 'LOW RISK',
                    riskColor: const Color(0xFFE8F5E9), // Light Green bg for badge
                    riskTextColor: const Color(0xFF1B5E20), // Dark green text
                    icon: Icons.water_drop,
                    iconBg: const Color(0xFF1B5E20).withOpacity(0.2),
                    iconColor: primaryColor,
                  ),
                  
                  const SizedBox(height: 16),

                  // Pests Risk Card (Medium)
                  _buildRiskCard(
                    title: 'Pests',
                    description: 'Small chance of Fall Armyworm nearby. Monitor young leaves closely.',
                    riskLevel: 'MEDIUM RISK',
                    riskColor: const Color(0xFFFFF8E1), // Light Amber bg
                    riskTextColor: const Color(0xFFF57F17), // Dark amber text
                    icon: Icons.pest_control,
                    iconBg: const Color(0xFFF57F17).withOpacity(0.1),
                    iconColor: Colors.amber,
                  ),

                  const SizedBox(height: 16),

                  // Market Risk Card (Low)
                  _buildRiskCard(
                    title: 'Market',
                    description: 'Maize prices are stable and expected to rise next season.',
                    riskLevel: 'LOW RISK',
                    riskColor: const Color(0xFFE8F5E9),
                    riskTextColor: const Color(0xFF1B5E20),
                    icon: Icons.storefront,
                    iconBg: const Color(0xFF1B5E20).withOpacity(0.2),
                    iconColor: primaryColor,
                  ),

                  const SizedBox(height: 24),

                  // Detailed Advice Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                         // Could define another screen or expanding logic here
                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Connecting to advisor...")));
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: primaryColor, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      icon: const Icon(Icons.support_agent, color: Colors.white),
                      label: Text(
                        'Get Detailed Advice',
                        style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildRiskCard({
    required String title,
    required String description,
    required String riskLevel,
    required Color riskColor,
    required Color riskTextColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    // Dark mode overrides for card look
    const cardBg = Color(0xFF1C2E24);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: riskColor.withOpacity(0.9), // Keeping badge bright for visibility or dimming appropriately
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    riskLevel,
                    style: TextStyle(
                      color: riskTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF8BA898),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: iconColor, size: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    const Color primaryColor = Color(0xFF13EC6A);
    final navBg = const Color(0xFF0D1C13).withOpacity(0.9);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: navBg,
        border: const Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 'Home', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))),
          _buildNavItem(Icons.spa, 'Guide', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CropGuideScreen()))),
          _buildNavItem(Icons.history, 'History', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatHistoryScreen()))),
          _buildNavItem(Icons.tips_and_updates, 'Advisory', true, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdvisoryScreen()))),
          _buildNavItem(Icons.store, 'Market', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MarketplaceScreen()))),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected) 
            Container(height: 6, width: 6, margin: const EdgeInsets.only(bottom: 2), decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color, blurRadius: 6)])),
          Icon(icon, color: isSelected ? color : const Color(0xFF8BA898), size: 26),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : const Color(0xFF8BA898))),
        ],
      ),
    );
  }
}
