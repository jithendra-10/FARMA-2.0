import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';
import '../advisory/advisory_screen.dart';
import '../profile/profile_screen.dart';
import '../history/chat_history_screen.dart';
import '../market/marketplace_screen.dart';

class CropGuideScreen extends StatefulWidget {
  const CropGuideScreen({super.key});

  @override
  State<CropGuideScreen> createState() => _CropGuideScreenState();
}

class _CropGuideScreenState extends State<CropGuideScreen> {
  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundDark = Color(0xFF102217);
  static const Color surfaceDark = Color(0xFF1A2C22);
  
  // Filter state
  int _selectedFilterIndex = 0;
  final List<Map<String, dynamic>> _filters = [
    {'icon': Icons.grid_view, 'label': 'All'},
    {'icon': Icons.grass, 'label': 'Grains'},
    {'icon': Icons.local_restaurant, 'label': 'Vegetables'}, // material symbol 'nutrition' maps roughly to restaurant or eco
    {'icon': Icons.local_florist, 'label': 'Fruits'},
    {'icon': Icons.attach_money, 'label': 'Cash Crops'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Crop Guide',
                        style: GoogleFonts.lexend(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.notifications, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      // Search Bar
                      Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: surfaceDark,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: Colors.white.withOpacity(0.05)),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search crops...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 48, height: 48,
                              margin: const EdgeInsets.only(right: 4),
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.mic, color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Tip/Prompt
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: primaryColor.withOpacity(0.2)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.tips_and_updates, color: primaryColor, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Not sure what to plant? Tap the microphone button to ask about soil types or seasons in your local language.',
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Filter Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(_filters.length, (index) {
                            final isSelected = index == _selectedFilterIndex;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedFilterIndex = index),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected ? primaryColor : surfaceDark,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: isSelected ? primaryColor : Colors.white.withOpacity(0.05)),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      _filters[index]['icon'] as IconData,
                                      size: 18,
                                      color: isSelected ? Colors.black : Colors.grey[300],
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _filters[index]['label'] as String,
                                      style: GoogleFonts.lexend(
                                        color: isSelected ? Colors.black : Colors.grey[300],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                        children: [
                          _buildCropCard(
                            name: 'Maize',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA5MExohcO7M8Ed4KfsIQsxCnebIsAV6H2EsvUQFuieIT2OxYGtbAcObb3j5iNvMtPWP4feQsLgyh-f5oA2HMbHEF-ZNnurnSva5x3tPxpr3KbXHAhaNlZJMOAQy8BbpPHx_sY73zPORloJ0XwKgu8nKS4knl2ZDrZzRVeQO3TEgdWDH3wo1XuMxsTkKU1LrkwzMygdOie-cO0Sde2R4ABYPNVwgGC7OBtbxNgaRct3kVjNQylBRJT0WZ8Y0To_k_GLYJNXMhGlxGk',
                            badge: 'High Value',
                            tags: [
                              {'icon': Icons.water_drop, 'label': 'Moderate'},
                              {'icon': Icons.calendar_month, 'label': '90 Days'},
                            ],
                          ),
                          _buildCropCard(
                            name: 'Tomato',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAFUKzGUzL8PzBfZdoQRKXVCWuMM07U7NO8qkaP3SGN9ZcLjvq7ZQeReIRN97NEgMl3-rLTZiAQ7LSDmcZQQBBKjRi7Mh3iSjdwANSFxptU6ki9s7rUJr4_xO6sRoagBjxs6xwXrv9k4R226LtlMhJyC2ww4UvfOrr8GNKI6j10FagteUPdRVxBEPhBeLSBmeQXVHVOwxA-fqDmKRFHA5kPfYuX3-018_y9_69PvpxFZQhrm21vyVVBe52nOPzLchU6VKrvbfFWwOE',
                            
                            tags: [
                              {'icon': Icons.water_drop, 'label': 'High Water', 'color': Colors.blue},
                              {'icon': Icons.monetization_on, 'label': 'Cash Crop'},
                            ],
                          ),
                          _buildCropCard(
                            name: 'Sorghum',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-_HdpgXH0bTDYI10S15hyhl06hUnyMyz-KH95AdP3riAu1wKDkZdYMDNWPf-zIrm28IlmE9i1QHJmi6DqjsZ4ebKF7M1C72ykZlqlxRyvWS3d-5VOGTR_TBDCLZRUOWE1JIKvlNbu2jU-ruAfkpp0n8XCTBsDLM2zCdNLXWXSmuRrwHOuPZ1CRrmVlMSWieEwUujIxk27g4RLPSffvR1ThOPqnUBZdfDoPghta05USo4ZxMbmz0c5iBduk7g3mI9ynqAXK_uJKBM',
                            badge: 'Recommended',
                            badgeColor: primaryColor,
                            badgeTextColor: Colors.black,
                            tags: [
                              {'icon': Icons.wb_sunny, 'label': 'Drought Res', 'color': Colors.amber},
                            ],
                          ),
                          _buildCropCard(
                            name: 'Cassava',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA40BP4Wtlb9RjOKbgBDg-b7ghrPbImCJr3SAROwnunVObl1UQigw9u38ZyJjxUHkxrnstKCeKaopNXUEAVXxfLhDjy7pUeLUn7I846I-mt2UmQOhUsfPkA7SH2_ivlshardZcM_vuAAtPYNiSBeCcZaWHTtqyyM7PsjJvGHU8NYZYG29FAD83ffKemoOWOXER7vVLciGPFS48WHKHzLjjt5L3uafHwEj1eQhFtHBuwtFDTp1Z4nmP87JxBhcGo6IuEYUG5CUBpSIY',
                            tags: [
                              {'icon': Icons.shield, 'label': 'Resilient'},
                              {'icon': Icons.build, 'label': 'Easy Care'},
                            ],
                          ),
                           _buildCropCard(
                            name: 'Coffee',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC7kr6Zq6l0p6Vz7ucLQKIepjrKlnkIl8-d_jVfNxn-98PD_2w4E292FvYLYMSvAjrOWzg8ZSlMm3VhvKpce9_4trXt57M9ZhSvAhKoyBF7ZBipwu_oW8fLOQ_Mn7NAHagtiunsAMypPiaQQTgqy9AQr4_7W_KSfys52wLHkOTehLDIoldO8ich69Ci7S5xkMLVRZsbg2ZT9L4JeL1b8zJdGEWqX9GXxx03EdE_8iEw-Shy7_JDlzdeVZDQz9Ml_8Z4IFkWr6Qs2zE',
                            tags: [
                              {'icon': Icons.landscape, 'label': 'Highland'},
                              {'icon': Icons.attach_money, 'label': 'Export'},
                            ],
                          ),
                          _buildCropCard(
                            name: 'Apples',
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCBzU00Pa5_c0iMPsaTH3WSQELLl0Ix2aYgqbynOp9sUQSSQaETnxriVjPqKui0tpmGfx30WpID3DMXu_upO6zqoQmW0bOn_vUXeojtYNOFtFecAF8pDM-UpUjLqJ3wgCX7XV8k1fXosNkK1CFsmS0cixuxzDgEP8zCZ_1kEz4Hf8zOsI-9U6qc5gVuwtTZwG42HuI_PRyW1AuSEcD2AUs4882zrf9LEl3JxB6hW3azYwHi_qt5eTXCaXwsGXR-5xd5bmjy95jDZt0',
                            tags: [
                              {'icon': Icons.ac_unit, 'label': 'Cold Climate'},
                            ],
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),

            // Floating Mic Button
            Positioned(
              bottom: 100,
              right: 16,
              child: Container(
                width: 64, height: 64,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 30, offset: const Offset(0, 8)),
                  ],
                ),
                child: const Icon(Icons.mic, size: 32, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildCropCard({
    required String name,
    required String imageUrl,
    String? badge,
    Color badgeColor = Colors.black54, // Default to translucent black
    Color badgeTextColor = primaryColor, // Default text color
    required List<Map<String, dynamic>> tags,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(imageUrl, fit: BoxFit.cover),
                if (badge != null)
                  Positioned(
                    top: 8, right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: badge == 'High Value' ? Colors.black.withOpacity(0.6) : badgeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          color: badge == 'High Value' ? primaryColor : badgeTextColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                    ],
                  ),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(tag['icon'] as IconData, size: 12, color: tag['color'] as Color? ?? Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              tag['label'] as String,
                              style: const TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
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
          _buildNavItem(Icons.spa, 'Guide', true, primaryColor), // Active
          _buildNavItem(Icons.history, 'History', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatHistoryScreen()))),
          _buildNavItem(Icons.tips_and_updates, 'Advisory', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdvisoryScreen()))), 
          _buildNavItem(Icons.store, 'Market', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MarketplaceScreen()))),
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
