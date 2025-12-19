import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../advisory/fertilizer_screen.dart';
import '../comparison/what_if_screen.dart';
import '../risk/risk_assessment_screen.dart';
import '../home/home_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../history/chat_history_screen.dart';
import '../advisory/advisory_screen.dart';
import '../market/marketplace_screen.dart';

class CropPlanScreen extends StatelessWidget {
  const CropPlanScreen({super.key});

  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundDark = Color(0xFF102217);
  static const Color surfaceDark = Color(0xFF1A2C22);
  static const Color surfaceHighlight = Color(0xFF23392D);
  static const Color textDark = Color(0xFF111814);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleBtn(Icons.arrow_back, onTap: () => Navigator.pop(context)),
                  Column(
                    children: [
                      Text(
                        'Crop Detail Plan',
                        style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'MAIZE • KHARIF 2024',
                        style: GoogleFonts.lexend(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: primaryColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  _buildCircleBtn(Icons.more_vert, color: Colors.transparent, iconColor: Colors.white54),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Hero Image Card
                  Container(
                    height: 224,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCBCsZR70QAnAo_qy3hIXVaXfEwVBT0b4n3A-7pqxQbCwnDT9hHlnAsVK__bSkZ0UtPehbW1yDV9BbqX_RsX58h1VnIUMl-r5ycxa9qW_Ytg09xSa89Gzv_2FYHSLdREhA03bDZt3_0n82j8IXUlFZLr-8mgHeK_rsQTuREeCkWCnavbux5RWvqYV7qmkMESe7TpdTvs3D0ZDOKgozj0MpcSmULOUDIoXyu0q1g0kG4G5VpZdJP2d38q0jUBMzpIn3TtX7Q62_5q4g'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [backgroundDark, Colors.transparent],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.verified, size: 16, color: backgroundDark),
                                const SizedBox(width: 4),
                                Text(
                                  '95% Match',
                                  style: GoogleFonts.lexend(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: backgroundDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maize (Corn)',
                                style: GoogleFonts.lexend(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'High Yield Variety • Hybrid 402',
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // AI Audio Player
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.graphic_eq, color: primaryColor, size: 20),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI ASSISTANT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'Listening to plan details...',
                                  style: TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.play_arrow, size: 18, color: backgroundDark),
                              const SizedBox(width: 4),
                              Text(
                                'REPLAY',
                                style: GoogleFonts.lexend(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: backgroundDark,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Why this fits
                  Row(
                    children: [
                      const Icon(Icons.psychology, color: primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Why this crop fits',
                        style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Column(
                      children: [
                        _buildFitReason(Icons.landscape, Colors.orange, 'Sandy Soil Compatibility', 'Your soil test indicates loose texture. Maize roots penetrate deep easily here, unlike clay-heavy crops.'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(color: Colors.white.withOpacity(0.05), height: 1),
                        ),
                        _buildFitReason(Icons.wb_sunny, Colors.yellow, 'Kharif Season Alignment', 'Current temperatures (28°C avg) are optimal for germination. It fits perfectly into your 3-month rotation window.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Stats Grid
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.agriculture, 
                          trendIcon: Icons.trending_up, 
                          value: '25-30', 
                          unit: 'QUINTALS / ACRE', 
                          subtext: 'Est. revenue: ₹55k - ₹65k',
                          highlightColor: primaryColor
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.water_drop, 
                          value: '500-600', 
                          unit: 'MM TOTAL WATER', 
                          subtext: 'Critical irrigation: Flowering', 
                          highlightColor: Colors.blue
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Risk Assessment
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shield, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Risk Assessment',
                            style: GoogleFonts.lexend(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: primaryColor.withOpacity(0.2)),
                        ),
                        child: const Text('LOW RISK', style: TextStyle(color: primaryColor, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This crop carries minimal risk for your specific profile. Here is why:',
                          style: TextStyle(color: Colors.grey[300], fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 16),
                        _buildRiskItem('Pest Resistance', 'This hybrid variety is resistant to Fall Armyworm, a common local threat.'),
                        const SizedBox(height: 12),
                        _buildRiskItem('Market Stability', 'Local starch factories have guaranteed buy-back programs this season.'),
                        const SizedBox(height: 12),
                        _buildRiskItem('Short Duration', '90-day maturity reduces exposure to late-season heavy rains.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tools Section Title
                  Row(
                    children: [
                      const Icon(Icons.handyman, color: primaryColor), // Changed icon to represent tools
                      const SizedBox(width: 8),
                      Text(
                        'Analysis Tools',
                         style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Tools List
                  Column(
                    children: [
                      // 1. Fertilizer Guidance (Suggestions)
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FertilizerScreen())),
                        child: _buildToolCard(
                          icon: Icons.science, 
                          iconColor: Colors.blue, 
                          title: 'Fertilizer Guidance', 
                          subtitle: 'Comparison of Organic vs NPK'
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // 2. What If Analysis
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WhatIfScreen())),
                        child: _buildToolCard(
                          icon: Icons.compare_arrows, 
                          iconColor: Colors.purple, 
                          title: 'What-If Comparison', 
                          subtitle: 'Compare Maize vs Sorghum'
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // 3. Risk Awareness (Placeholder for now, user mentioned it)
                      GestureDetector(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (_) => const RiskAssessmentScreen()));
                        },
                        child: _buildToolCard(
                          icon: Icons.shield, 
                          iconColor: Colors.orange, 
                          title: 'Risk Awareness', 
                          subtitle: 'View market and pest risks'
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Save Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: backgroundDark,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 8,
                      shadowColor: primaryColor.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save_alt),
                        const SizedBox(width: 8),
                        Text(
                          'Save Plan to Profile',
                          style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'FARMA INTELLIGENT SYSTEM',
                        style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold),
                      ),
                    ),
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

  Widget _buildCircleBtn(IconData icon, {VoidCallback? onTap, Color color = Colors.white, Color iconColor = Colors.black}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48, height: 48,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }

  Widget _buildFitReason(IconData icon, Color iconColor, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: surfaceHighlight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: TextStyle(color: Colors.grey[400], fontSize: 14, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({required IconData icon, IconData? trendIcon, required String value, required String unit, required String subtext, required Color highlightColor}) {
    return Container(
      height: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.grey[400]),
              if (trendIcon != null) Icon(trendIcon, color: highlightColor, size: 14),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                unit,
                style: TextStyle(color: highlightColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
              const SizedBox(height: 4),
              Text(
                subtext,
                style: TextStyle(color: Colors.grey[500], fontSize: 10, height: 1.1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRiskItem(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: primaryColor, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey[400], fontSize: 12, height: 1.5),
              children: [
                TextSpan(text: '$title: ', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                TextSpan(text: desc),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToolCard({required IconData icon, required Color iconColor, required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
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
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
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
          Icon(icon, color: isSelected ? color : Colors.grey, size: 26),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : Colors.grey)),
        ],
      ),
    );
  }
}
