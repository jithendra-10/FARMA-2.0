import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/auth_service.dart';
import './otp_verification_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Colors from the design
  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundLight = Color(0xFFF6F8F7);
  static const Color backgroundDark = Color(0xFF102217);
  static const Color surfaceDark = Color(0xFF1A2E22);

  final _authService = AuthService();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  
  bool _isLoading = false;
  String _selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = isDark ? backgroundDark : backgroundLight;
    final Color textColor = isDark ? Colors.white : backgroundDark;
    final Color cardColor = isDark ? surfaceDark : Colors.white;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[200]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Background Gradients
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 256,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryColor.withOpacity(0.1), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            top: -96,
            right: -96,
            width: 256,
            height: 256,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    children: [
                      const SizedBox(height: 24),
                      // Header Section with Logo
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Stack(
                                children: [
                                  // Rotated background
                                  Transform.rotate(
                                    angle: 6 * 3.14159 / 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                  // Logo Container
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isDark ? surfaceDark : Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: primaryColor.withOpacity(0.1)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDHUSX4B6YQGBTIzGVZdlM5DfX0nv0YENIdlKEyIPp4oBOHBm2-5DZWPkwF-Fjz8gebfgkTc84oKmsaw2zD5k0kQ3QXllvwohOPViSZP1AIE_4EMt3-9djhj9jT0LPZKkRxLQdtsXmBgncpeOcc6X-rLtObx6gPX4ZSG7qJWTYfNlDxXWm57ZyM1b7eaY-8fAf1OJ8p0UlSLe87YEp0ibngPij4t4zKvYURxwcLNbX-vW4obN0Ivb_ugBY3s9rsQSQVNriA0s0kjl4',
                                          width: 48,
                                          height: 48,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stackTrace) => 
                                            const Icon(Icons.agriculture, color: primaryColor, size: 32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Create Account',
                              style: GoogleFonts.lexend(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Enter your details to sign up',
                              style: GoogleFonts.lexend(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Form Card
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                             BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Full Name', isDark),
                            _buildTextField(
                              controller: _nameController,
                              hint: 'Enter your name',
                              icon: Icons.person_outline,
                              isDark: isDark,
                            ),
                            const SizedBox(height: 20),
                            
                            _buildLabel('Mobile Number', isDark),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isDark ? backgroundDark : backgroundLight,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: borderColor),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: '+91',
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      dropdownColor: isDark ? backgroundDark : backgroundLight,
                                      items: ['+91', '+1', '+44'].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            children: [
                                              const Text('🇮🇳', style: TextStyle(fontSize: 20)),
                                              const SizedBox(width: 8),
                                              Text(value, style: GoogleFonts.lexend(fontSize: 16)),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _buildTextField(
                                    controller: _phoneController,
                                    hint: '98765 43210',
                                    keyboardType: TextInputType.phone,
                                    isDark: isDark,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            // Password fields removed for OTP-based flow

                            
                            const SizedBox(height: 24),
                            
                            // Continue Button
                            ElevatedButton(
                              onPressed: _isLoading ? null : () async {
                                final name = _nameController.text;
                                final phone = '+91${_phoneController.text}'; // Hardcoded +91 for hackathon
                                
                                if (name.isEmpty || _phoneController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
                                  return;
                                }

                                setState(() => _isLoading = true);
                                final success = await _authService.register(phone, name, _selectedLang);
                                setState(() => _isLoading = false);

                                if (success && mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => OtpVerificationScreen(phone: phone)),
                                  );
                                } else if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Failed. Check connection.')));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: backgroundDark,
                                elevation: 4,
                                shadowColor: primaryColor.withOpacity(0.4),
                                minimumSize: const Size(double.infinity, 60),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              child: _isLoading 
                                ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Continue to Verify',
                                        style: GoogleFonts.lexend(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward_rounded, size: 22),
                                    ],
                                  ),
                            ),
                            
                            const SizedBox(height: 12),
                            
                            // Info Badge
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(isDark ? 0.1 : 0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.verified_user_outlined, color: primaryColor, size: 20),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'An OTP will be sent to your phone number for verification.',
                                      style: GoogleFonts.lexend(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Log In Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account? ', style: GoogleFonts.lexend(color: Colors.grey)),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Text(
                                    'Log In',
                                    style: GoogleFonts.lexend(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Language Selector
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(child: Divider(color: borderColor)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'LANGUAGE',
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400],
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: borderColor)),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      Column(
                        children: [
                          _buildLanguageOption('English', 'English', isDark),
                          const SizedBox(height: 12),
                          _buildLanguageOption('Telugu', 'తెలుగు', isDark),
                          const SizedBox(height: 12),
                          _buildLanguageOption('Hindi', 'हिन्दी', isDark),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.spa, color: primaryColor, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'EMPOWERING FARMERS',
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isDark ? const Color(0xFF8AB39A) : const Color(0xFF618971),
                          letterSpacing: 1.2,
                        ),
                      ),
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

  Widget _buildLabel(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.grey[300] : Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    IconData? icon,
    TextEditingController? controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
    required bool isDark,
  }) {
    final Color fillColor = isDark ? backgroundDark : backgroundLight;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[200]!;

    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.lexend(fontSize: 18),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey[400], size: 22) : null,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey[400],
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String englishName, String nativeName, bool isDark) {
    final bool isSelected = _selectedLang == englishName;
    final Color cardBg = isDark ? surfaceDark : Colors.white;
    final Color borderColor = isSelected ? primaryColor : (isDark ? Colors.grey[800]! : Colors.grey[100]!);
    final Color iconBg = isDark ? backgroundDark : backgroundLight;

    return GestureDetector(
      onTap: () => setState(() => _selectedLang = englishName),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.translate,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nativeName,
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (englishName != nativeName)
                  Text(
                    englishName.toUpperCase(),
                    style: GoogleFonts.lexend(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey[300]!,
                  width: 2,
                ),
                color: isSelected ? primaryColor : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 14, color: Colors.white),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // Helper helper method removed
}
