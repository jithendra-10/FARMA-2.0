import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/registration_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart'; // Import the new home screen

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundLightColor = Color(0xFFF6F8F7);
  static const Color textDarkColor = Color(0xFF102217);
  static const Color textGrayColor = Color(0xFF6B7280);

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // Keep language selection separate for now, or tie it to a user profile later.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildLoginForm(context),
            const SizedBox(height: 32),
            _buildLanguageSelector(),
            const SizedBox(height: 32),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        _buildSmallLogo(),
        const SizedBox(height: 16),
        Text(
          'Log in to FARMA',
          style: GoogleFonts.lexend(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textDarkColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Access your farm assistant',
          style: GoogleFonts.lexend(
            fontSize: 14,
            color: textGrayColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSmallLogo() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: 6 * 3.14159 / 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: primaryColor.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: primaryColor.withOpacity(0.1)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Center(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDHUSX4B6YQGBTIzGVZdlM5DfX0nv0YENIdlKEyIPp4oBOHBm2-5DZWPkwF-Fjz8gebfgkTc84oKmsaw2zD5k0kQ3QXllvwohOPViSZP1AIE_4EMt3-9djhj9jT0LPZKkRxLQdtsXmBgncpeOcc6X-rLtObx6gPX4ZSG7qJWTYfNlDxXWm57ZyM1b7eaY-8fAf1OJ8p0UlSLe87YEp0ibngPij4t4zKvYURxwcLNbX-vW4obN0Ivb_ugBY3s9rsQSQVNriA0s0kjl4'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Phone Number or Farmer ID', style: TextStyle(fontSize: 14, color: textGrayColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          _buildTextField(icon: Icons.account_circle_outlined, hint: 'Enter ID'),
          const SizedBox(height: 16),
          const Text('Password', style: TextStyle(fontSize: 14, color: textGrayColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          _buildTextField(icon: Icons.lock_outline, hint: '••••••', isPassword: true),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: textDarkColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              shadowColor: primaryColor.withOpacity(0.3),
            ),
            onPressed: () {
              // Navigate to the new HomeScreen
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Log In', style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot ID?', style: TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?", style: TextStyle(color: textGrayColor)),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                },
                child: const Text('Sign Up', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextField _buildTextField({required IconData icon, required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: textGrayColor, size: 22),
        filled: true,
        fillColor: backgroundLightColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: primaryColor, width: 2)),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('LANGUAGE', style: TextStyle(color: textGrayColor.withOpacity(0.7), fontWeight: FontWeight.w600, letterSpacing: 1)),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        _buildLanguageButton('English', null, Icons.translate_outlined, 'English'),
        const SizedBox(height: 12),
        _buildLanguageButton('తెలుగు', 'Telugu', Icons.graphic_eq_outlined, 'Telugu'),
        const SizedBox(height: 12),
        _buildLanguageButton('हिन्दी', 'Hindi', Icons.graphic_eq_outlined, 'Hindi'),
      ],
    );
  }

  Widget _buildLanguageButton(String title, String? subtitle, IconData icon, String langCode) {
    final isSelected = _selectedLanguage == langCode;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => _selectLanguage(langCode),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isSelected ? primaryColor : Colors.grey.shade200)),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: backgroundLightColor, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: textGrayColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textDarkColor)),
                    if (subtitle != null) Text(subtitle, style: const TextStyle(fontSize: 12, color: textGrayColor)),
                  ],
                ),
              ),
              Container(
                width: 24, 
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  border: Border.all(color: isSelected ? primaryColor : Colors.grey.shade300, width: 2)
                ),
                child: isSelected ? Center(child: Container(width: 12, height: 12, decoration: const BoxDecoration(shape: BoxShape.circle, color: primaryColor))) : null,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.spa_outlined, color: primaryColor, size: 20),
        const SizedBox(width: 8),
        Text(
          'EMPOWERING FARMERS',
          style: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF618971),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
