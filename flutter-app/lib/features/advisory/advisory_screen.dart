import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../profile/profile_screen.dart';
import 'fertilizer_screen.dart';
import '../risk/risk_assessment_screen.dart';
import '../comparison/what_if_screen.dart';
import '../history/chat_history_screen.dart';
import '../market/marketplace_screen.dart';

class AdvisoryScreen extends StatelessWidget {
  const AdvisoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF13EC6A);
    const Color backgroundDark = Color(0xFF102217);

    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
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
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Advisory Hub',
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Section: Intelligence Overview
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1A3826), Color(0xFF102217)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.auto_awesome, color: primaryColor, size: 24),
                              const SizedBox(width: 12),
                              Text(
                                "FARM INTELLIGENCE",
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Your crops are looking healthy, but watch out for humidity levels.",
                            style: GoogleFonts.lexend(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Recent Alerts
                    Text(
                      "Recent Alerts",
                      style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildAlertCard(
                            icon: Icons.water_drop,
                            title: "High Humidity",
                            message: "Fungal risk +15%",
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 12),
                          _buildAlertCard(
                            icon: Icons.trending_up,
                            title: "Market Price",
                            message: "Maize up by 5%",
                            color: primaryColor,
                          ),
                          const SizedBox(width: 12),
                          _buildAlertCard(
                            icon: Icons.wb_sunny,
                            title: "Heat Wave",
                            message: "Expected in 3 days",
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Tools Grid
                    Text(
                      "Management Tools",
                      style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildEnhancedToolCard(
                          context,
                          title: 'Fertilizer',
                          subtitle: 'Nutrient Guide',
                          icon: Icons.science,
                          gradientColors: [Colors.blue.shade900, Colors.blue.shade800],
                          iconColor: Colors.blue.shade200,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FertilizerScreen())),
                        ),
                        _buildEnhancedToolCard(
                          context,
                          title: 'Risk Scan',
                          subtitle: 'Threat Analysis',
                          icon: Icons.shield,
                          gradientColors: [Colors.orange.shade900, Colors.orange.shade800],
                          iconColor: Colors.orange.shade200,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RiskAssessmentScreen())),
                        ),
                        _buildEnhancedToolCard(
                          context,
                          title: 'What-If',
                          subtitle: 'Scenario Planner',
                          icon: Icons.compare_arrows,
                          gradientColors: [Colors.purple.shade900, Colors.purple.shade800],
                          iconColor: Colors.purple.shade200,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WhatIfScreen())),
                        ),
                        _buildEnhancedToolCard(
                          context,
                          title: 'Pest Control',
                          subtitle: 'Coming Soon',
                          icon: Icons.pest_control,
                          gradientColors: [const Color(0xFF2A1010), const Color(0xFF200A0A)],
                          iconColor: Colors.red.shade200,
                          onTap: () {
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pest Control module coming soon!")));
                          },
                          isLocked: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 80), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildAlertCard({required IconData icon, required String title, required String message, required Color color}) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF183222),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(message, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400])),
        ],
      ),
    );
  }

  Widget _buildEnhancedToolCard(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> gradientColors,
    required Color iconColor,
    required VoidCallback onTap,
    bool isLocked = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors.map((c) => c.withOpacity(0.4)).toList(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: iconColor, size: 28),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.lexend(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        subtitle,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLocked)
              Positioned(
                top: 12,
                right: 12,
                child: Icon(Icons.lock, color: Colors.white.withOpacity(0.2), size: 16),
              ),
          ],
        ),
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
          _buildNavItem(Icons.history, 'History', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatHistoryScreen()))),
          _buildNavItem(Icons.tips_and_updates, 'Advisory', true, primaryColor), // Active
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
          Icon(icon, color: isSelected ? color : Colors.grey, size: 26),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : Colors.grey)),
        ],
      ),
    );
  }
}
