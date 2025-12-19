import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crop_plan_screen.dart';
import '../home/home_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../history/chat_history_screen.dart';
import '../advisory/advisory_screen.dart';
import '../market/marketplace_screen.dart';

class RecommendationResultScreen extends StatelessWidget {
  const RecommendationResultScreen({super.key});

  // Colors matching the design
  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundDark = Color(0xFF102217);
  static const Color surfaceDark = Color(0xFF1A2C22);
  static const Color surfaceHighlight = Color(0xFF23392D);
  static const Color textDark = Color(0xFF111814);

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
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleBtn(context, Icons.arrow_back, onTap: () => Navigator.pop(context)),
                  Column(
                    children: [
                      Text(
                        'Crop Recommendations',
                        style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'AI ANALYSIS COMPLETE',
                        style: GoogleFonts.lexend(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: primaryColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 48), // Balance
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Bot Summary
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40, height: 40,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor.withOpacity(0.2), width: 2),
                          image: const DecorationImage(
                            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDFBYgrSlRDO9FVl7kRkhfdV0NzE9dkzbIBd4F0q4VvTRUNoUBsveTslfd0CK1IBZeaU1lloh8qvfCaJtuDJqRSQ5eeBCqKCec6jfsodmcMJIFS8YGNRq1uxKRZrPbUeHMQkUnyBPlmwAgfKKWTkDATcZu-WjsyDR0q4Dhz5teA00b7trNOJZiwKy9RKSreyXoeOgStZTlSaAP8hrL4jShpzpGnqcD6NT0yii99kTiOTnPsPNh3-R_dVFdPzK9Os49B0R4D4Lg-OAY'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: surfaceDark,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  topLeft: Radius.circular(2),
                                ),
                              ),
                              child: Text(
                                "Based on your sandy soil and current Kharif season, I found 3 highly suitable crops for you.",
                                style: GoogleFonts.lexend(fontSize: 16, color: Colors.white, height: 1.5),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.volume_up, size: 16, color: primaryColor),
                                const SizedBox(width: 4),
                                Text(
                                  'REPLAY',
                                  style: GoogleFonts.lexend(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),

                  // Card 1: Maize
                  _buildCropCard(
                    context,
                    title: 'Maize (Corn)',
                    matchScore: '95% Match',
                    tag: 'High Yield Potential',
                    tagColor: primaryColor,
                    description: 'Excellent choice for your sandy soil. It requires less water retention and thrives in the warm Kharif temperatures.',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCBCsZR70QAnAo_qy3hIXVaXfEwVBT0b4n3A-7pqxQbCwnDT9hHlnAsVK__bSkZ0UtPehbW1yDV9BbqX_RsX58h1VnIUMl-r5ycxa9qW_Ytg09xSa89Gzv_2FYHSLdREhA03bDZt3_0n82j8IXUlFZLr-8mgHeK_rsQTuREeCkWCnavbux5RWvqYV7qmkMESe7TpdTvs3D0ZDOKgozj0MpcSmULOUDIoXyu0q1g0kG4G5VpZdJP2d38q0jUBMzpIn3TtX7Q62_5q4g',
                    matchBgColor: primaryColor,
                    matchTextColor: backgroundDark,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),

                  // Card 2: Groundnut
                  _buildCropCard(
                    context,
                    title: 'Groundnut',
                    matchScore: '88% Match',
                    tag: 'Soil Improver',
                    tagColor: const Color(0xFFEEC812), // Yellow
                    description: 'A nitrogen-fixing crop that naturally improves your soil fertility. Roots penetrate easily in loose soil.',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAAuM6G03euAFea_tUWZtuwHt9veBSYfSgV3_6faBCF4PRKJgtxYOiHt8HsN-3LTfza0nOBKHF4qHHnT90OadpdknSuW6ty8Kq01fvpVl8sDYD6wESQtx_wSbLaqH8ToeYmWB8HBVs7kERadsVIWV3vqkNUM7rHyT7yqKQVRIP8OY7bFVSNkCGcQUHkwW1eIQw9rRkzK8aOgbAJI22DTIx6wBlmvreNqi5dSzvrO2y3xhm8X6MzK5K9QwldxrOP9NaBQsA7QqMqXXA',
                    matchBgColor: const Color(0xFFEEC812),
                    matchTextColor: backgroundDark,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),

                   // Card 3: Pearl Millet
                  _buildCropCard(
                    context,
                    title: 'Pearl Millet',
                    matchScore: '82% Match',
                    tag: 'Low Risk',
                    tagColor: Colors.grey,
                    description: 'Highly drought-resistant. The safest option if irrigation availability is inconsistent during the season.',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDGPfEZHvK9_i2QYmnhXxRWQ0Hv3E_3o12hOozCNea-VFGCwKGeBzw6Dq3bLP2rECTkEmrwcBlu6yzA1XB3deokdNpFeDhzhrYibAix2jjiP1YIUgq_rVnpncNT-cMXykIDNaqFBI6fWF_nlNueNAgZfH_Rxdj1oeq4iaEaq6qBgtKxXT4CY8zMVyXpbd74Dcx0MkFmamhep6suiYZZWo0ETub5NrVKbrafIOeFW0aju633TQYKvmdohA7xTRASaQdRRg3f8suyIHw',
                    matchBgColor: Colors.white24,
                    matchTextColor: Colors.white,
                    textColor: textColor,
                    containerColor: containerColor,
                    borderColor: borderColor,
                  ),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24, top: 12),
                      child: Text(
                        'END OF RECOMMENDATIONS',
                        style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildCropCard(
    BuildContext context, {
    required String title,
    required String matchScore,
    required String tag,
    required Color tagColor,
    required String description,
    required String imageUrl,
    required Color matchBgColor,
    required Color matchTextColor,
    required Color textColor,
    required Color containerColor,
    required Color borderColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: containerColor,
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          Container(
            height: 176,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [containerColor, Colors.transparent],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: matchBgColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      matchScore,
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: matchTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tag.toUpperCase(),
                  style: GoogleFonts.lexend(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: tagColor,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.verified, color: tagColor, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                           description,
                           style: TextStyle(color: isDark ? Colors.grey[300] : Colors.grey[600], fontSize: 14, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to details
                    Navigator.push(
                      context, 
                       MaterialPageRoute(builder: (context) => const CropPlanScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: surfaceHighlight,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: borderColor),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Plan',
                        style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleBtn(BuildContext context, IconData icon, {VoidCallback? onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48, height: 48,
        decoration: BoxDecoration(
          color: isDark ? Colors.white : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
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
          _buildNavItem(context, Icons.history, 'History', false, primaryColor, onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatHistoryScreen()))),
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
          Icon(icon, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[400]), size: 26),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lexend(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? color : (isDark ? Colors.grey : Colors.grey[600]))),
        ],
      ),
    );
  }
}
