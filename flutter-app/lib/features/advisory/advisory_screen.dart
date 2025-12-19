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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = theme.primaryColor;
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;
    final containerColor = isDark ? const Color(0xFF1A2C22) : Colors.white;
    final borderColor = theme.dividerColor.withOpacity(0.1);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
                      ),
                      child: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Advisory Hub',
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
                        border: Border.all(color: borderColor),
                        boxShadow: isDark ? [] : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
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
                      style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildAlertCard(
                            context,
                            icon: Icons.water_drop,
                            title: "High Humidity",
                            message: "Fungal risk +15%",
                            color: Colors.orange,
                            textColor: textColor,
                            borderColor: borderColor,
                          ),
                          const SizedBox(width: 12),
                          _buildAlertCard(
                            context,
                            icon: Icons.trending_up,
                            title: "Market Price",
                            message: "Maize up by 5%",
                            color: primaryColor,
                            textColor: textColor,
                            borderColor: borderColor,
                          ),
                          const SizedBox(width: 12),
                          _buildAlertCard(
                            context,
                            icon: Icons.wb_sunny,
                            title: "Heat Wave",
                            message: "Expected in 3 days",
                            color: Colors.redAccent,
                            textColor: textColor,
                            borderColor: borderColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Tools Grid
                    Text(
                      "Management Tools",
                      style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
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
                          textColor: textColor,
                          borderColor: borderColor,
                        ),
                        _buildEnhancedToolCard(
                          context,
                          title: 'Risk Scan',
                          subtitle: 'Threat Analysis',
                          icon: Icons.shield,
                          gradientColors: [Colors.orange.shade900, Colors.orange.shade800],
                          iconColor: Colors.orange.shade200,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RiskAssessmentScreen())),
                          textColor: textColor,
                          borderColor: borderColor,
                        ),
                        _buildEnhancedToolCard(
                          context,
                          title: 'What-If',
                          subtitle: 'Scenario Planner',
                          icon: Icons.compare_arrows,
                          gradientColors: [Colors.purple.shade900, Colors.purple.shade800],
                          iconColor: Colors.purple.shade200,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WhatIfScreen())),
                          textColor: textColor,
                          borderColor: borderColor,
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
                          textColor: textColor,
                          borderColor: borderColor,
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

  Widget _buildAlertCard(BuildContext context, {required IconData icon, required String title, required String message, required Color color, required Color textColor, required Color borderColor}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF183222) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: textColor)),
          const SizedBox(height: 4),
          Text(message, style: GoogleFonts.lexend(fontSize: 12, color: isDark ? Colors.grey[400] : Colors.grey[600])),
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
    required Color textColor,
    required Color borderColor,
  }) {
    // For light mode, we might want to dampen the gradient or just use solid colors.
    // However, the user asked for consistent "Dark Theme" feel which implies some vibrancy.
    // But for light mode "pure white" requirement, maybe these cards should just be white with colored icons?
    // Let's stick to the gradient but maybe cleaner for Light mode or just keep it as "feature cards".
    // Actually, let's keep the gradient for "Tools" as they are engaging, but maybe opacity adjustment.
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors.map((c) => c.withOpacity(0.8)).toList(), // Increased opacity for better visibility
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor),
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
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
                          color: Colors.white, // Always white on gradient
                        ),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        subtitle,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          color: Colors.white70,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final navBg = isDark ? const Color(0xFF0D1C13).withOpacity(0.9) : Colors.white;
    const primaryColor = Color(0xFF13EC6A);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          _buildNavItem(context, Icons.history, 'History', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatHistoryScreen()))),
          _buildNavItem(context, Icons.tips_and_updates, 'Advisory', true, primaryColor), // Active
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
          Icon(icon, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[400]), size: 26),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[600]))),
        ],
      ),
    );
  }
}
