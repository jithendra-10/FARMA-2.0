import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../recommendations/recommendation_result_screen.dart';
import '../guide/crop_guide_screen.dart';
import '../advisory/advisory_screen.dart';
import '../profile/profile_screen.dart';
import '../profile/profile_screen.dart';

class AssistantChatScreen extends StatefulWidget {
  const AssistantChatScreen({super.key});

  @override
  State<AssistantChatScreen> createState() => _AssistantChatScreenState();
}

class _AssistantChatScreenState extends State<AssistantChatScreen> {
  // Styles & Colors matching the design
  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundLight = Color(0xFFF6F8F7);
  static const Color backgroundDark = Color(0xFF102217);
  static const Color surfaceDark = Color(0xFF1A2C22);
  static const Color surfaceHighlight = Color(0xFF23392D);
  static const Color textDark = Color(0xFF111814);

  // State
  int _currentStep = 0;
  final ScrollController _scrollController = ScrollController();

  // Form Data
  String? location;
  String? soilType;
  String? season;
  String? irrigation;
  TextEditingController landAreaController = TextEditingController();
  String landAreaUnit = 'Acres';

  @override
  void initState() {
    super.initState();
    // Start with the first question visible
  }

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
    // Scroll to bottom after a slight delay to allow rendering
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = isDark ? backgroundDark : backgroundLight;
    final Color textColor = isDark ? Colors.white : textDark;

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(top: 48, bottom: 16, left: 16, right: 16),
            color: bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleBtn(Icons.arrow_back, isDark, onTap: () => Navigator.pop(context)),
                Column(
                  children: [
                    Text(
                      'New Farm Profile',
                      style: GoogleFonts.lexend(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: textColor
                      ),
                    ),
                    Text(
                      'GUIDED ASSESSMENT',
                      style: GoogleFonts.lexend(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: primaryColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 48), // Spacer for centering
              ],
            ),
          ),

          // Chat Content
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                // STEP 1: Location
                _buildQuestionStep(
                  stepIndex: 0,
                  question: "Let's start. Where is your farm located?",
                  content: _buildLocationInput(isDark),
                  isVisible: true,
                ),

                // STEP 2: Soil Type
                _buildQuestionStep(
                  stepIndex: 1,
                  question: "What type of soil do you have?",
                  content: _buildSoilSelector(isDark),
                  isVisible: _currentStep >= 1,
                ),

                // STEP 3: Season
                _buildQuestionStep(
                  stepIndex: 2,
                  question: "Which planting season is this for?",
                  content: _buildSeasonSelector(isDark),
                  isVisible: _currentStep >= 2,
                ),

                // STEP 4: Land Area
                _buildQuestionStep(
                  stepIndex: 3,
                  question: "What is the total land area?",
                  content: _buildLandAreaInput(isDark),
                  isVisible: _currentStep >= 3,
                ),

                // STEP 5: Irrigation
                _buildQuestionStep(
                  stepIndex: 4,
                  question: "Is irrigation available?",
                  content: _buildIrrigationSelector(isDark),
                  isVisible: _currentStep >= 4,
                ),

                 // Final "Next Step" Action (Only visible at the end for final submission)
                 if (_currentStep >= 4 && irrigation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 48),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const RecommendationResultScreen())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: backgroundDark,
                        elevation: 8,
                        shadowColor: primaryColor.withOpacity(0.4),
                        minimumSize: const Size(double.infinity, 64),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Generate Plan', // Changed to "Generate Plan" as it's the final step
                              style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                            ),
                          ),
                          Container(
                            width: 48, 
                            height: 48,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1), shape: BoxShape.circle),
                            child: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 100), // Bottom padding for nav
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, isDark),
    );
  }

  // --- Widget Builders ---

  Widget _buildQuestionStep({
    required int stepIndex, 
    required String question, 
    required Widget content, 
    required bool isVisible
  }) {
    if (!isVisible) return const SizedBox.shrink();

    return Column(
      children: [
        // Bot Message
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
                      question,
                      style: GoogleFonts.lexend(fontSize: 16, color: Colors.white, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.volume_up, size: 16, color: primaryColor),
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
        
        // User Input / Selection Area
        Padding(
          padding: const EdgeInsets.only(left: 52, top: 12, bottom: 32),
          child: content,
        ),
      ],
    );
  }

  Widget _buildLocationInput(bool isDark) {
    if (_currentStep > 0) {
      // Completed State
      return Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: surfaceHighlight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          location ?? 'Anantapur, India', 
          style: GoogleFonts.lexend(color: primaryColor, fontWeight: FontWeight.bold)
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: surfaceDark,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey[400]),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search village, city...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (val) {
                    setState(() => location = val);
                    _nextStep();
                  },
                ),
              ),
              Icon(Icons.mic, color: Colors.grey[400]),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {
            setState(() => location = "Current Location");
            _nextStep();
          },
          icon: const Icon(Icons.my_location),
          label: const Text('Use Current Location'),
          style: ElevatedButton.styleFrom(
            backgroundColor: surfaceHighlight.withOpacity(0.5),
            foregroundColor: primaryColor,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: primaryColor.withOpacity(0.2)),
            ),
            textStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSoilSelector(bool isDark) {
    final types = ['Clay', 'Sandy', 'Loam', 'Black'];
    
    // Completed state logic could be added similar to Location
    
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: types.map((type) {
        final isSelected = soilType == type;
        return GestureDetector(
          onTap: _currentStep == 1 ? () {
             setState(() => soilType = type);
             _nextStep();
          } : null, // Disable if step completed (or allow edit?)
          child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
             decoration: BoxDecoration(
               color: isSelected ? surfaceHighlight : surfaceDark,
               borderRadius: BorderRadius.circular(12),
               border: Border.all(color: isSelected ? primaryColor : Colors.white10),
             ),
             child: Text(
               type,
               style: GoogleFonts.lexend(
                 color: isSelected ? primaryColor : Colors.white,
                 fontWeight: FontWeight.w500,
                 fontSize: 14,
               ),
             ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSeasonSelector(bool isDark) {
    final seasons = [
      {'icon': Icons.water_drop, 'name': 'Kharif'},
      {'icon': Icons.ac_unit, 'name': 'Rabi'},
      {'icon': Icons.wb_sunny, 'name': 'Zaid'},
    ];

    return Row(
      children: seasons.map((s) {
        final isSelected = season == s['name'];
        return Expanded(
          child: GestureDetector(
            onTap: _currentStep == 2 ? () {
              setState(() => season = s['name'] as String);
              _nextStep();
            } : null,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : surfaceDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isSelected ? primaryColor : Colors.white10),
              ),
              child: Column(
                children: [
                  Icon(s['icon'] as IconData, color: isSelected ? backgroundDark : Colors.white),
                  const SizedBox(height: 4),
                  Text(
                    s['name'] as String,
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? backgroundDark : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLandAreaInput(bool isDark) {
     if (_currentStep > 3) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: surfaceHighlight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            "${landAreaController.text} $landAreaUnit", 
            style: GoogleFonts.lexend(color: primaryColor, fontWeight: FontWeight.bold)
          ),
        );
     }
  
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: surfaceDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: TextField(
              controller: landAreaController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: surfaceDark,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: landAreaUnit,
              dropdownColor: surfaceDark,
              icon: const Icon(Icons.expand_more, color: Colors.white),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              onChanged: (val) {
                setState(() => landAreaUnit = val!);
              },
              items: ['Acres', 'Hectares', 'Guntha'].map((u) {
                return DropdownMenuItem(value: u, child: Text(u));
              }).toList(),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Submit button for this specific step
        IconButton(
          onPressed: () {
            if (landAreaController.text.isNotEmpty) {
              _nextStep();
            }
          },
          style: IconButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Icon(Icons.check, color: backgroundDark),
        )
      ],
    );
  }

  Widget _buildIrrigationSelector(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildIrrigationOption('Yes', Icons.check_circle, true),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildIrrigationOption('No', Icons.cancel, false),
        ),
      ],
    );
  }
  
  Widget _buildIrrigationOption(String label, IconData icon, bool value) {
     final isSelected = irrigation == label;
     
     return GestureDetector(
       onTap: () {
         setState(() => irrigation = label);
         if (_currentStep == 4) _nextStep();
       },
       child: Container(
         padding: const EdgeInsets.symmetric(vertical: 16),
         decoration: BoxDecoration(
           color: isSelected ? surfaceHighlight : surfaceDark,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: isSelected ? primaryColor : Colors.white10),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(icon, color: isSelected ? primaryColor : Colors.white),
             const SizedBox(width: 8),
             Text(
               label,
               style: GoogleFonts.lexend(
                 fontWeight: FontWeight.bold,
                 color: isSelected ? primaryColor : Colors.white,
               ),
             ),
           ],
         ),
       ),
     );
  }

  Widget _buildCircleBtn(IconData icon, bool isDark, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48, height: 48,
        decoration: BoxDecoration(
          color: isDark ? Colors.transparent : Colors.white,
          shape: BoxShape.circle,
          // border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Icon(icon, color: isDark ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isDark) {
    final navBg = const Color(0xFF0D1C13).withOpacity(0.9);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: navBg,
        border: const Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 'Home', false, primaryColor, onTap: () => Navigator.popUntil(context, (route) => route.isFirst)),
          _buildNavItem(Icons.spa, 'Crop Guide', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CropGuideScreen()))),
          _buildNavItem(Icons.tips_and_updates, 'Advisory', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdvisoryScreen()))), 
          _buildNavItem(Icons.person, 'Profile', false, primaryColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()))),
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
