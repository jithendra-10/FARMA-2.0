import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './otp_verification_screen.dart'; // We will create this next

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  // Re-using colors from our theme
  static const Color primaryColor = Color(0xFF13EC6A);
  static const Color backgroundLightColor = Color(0xFFF6F8F7);
  static const Color textDarkColor = Color(0xFF102217);
  static const Color textGrayColor = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textDarkColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildRegistrationForm(context),
            const SizedBox(height: 32),
            _buildLoginLink(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Create Account',
          style: GoogleFonts.lexend(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textDarkColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Get started on your smart farming journey.',
          style: GoogleFonts.lexend(
            fontSize: 16,
            color: textGrayColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRegistrationForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Full Name', style: TextStyle(fontSize: 14, color: textGrayColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          _buildTextField(icon: Icons.person_outline, hint: 'Enter your name'),
          const SizedBox(height: 16),
          const Text('Phone Number', style: TextStyle(fontSize: 14, color: textGrayColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          _buildTextField(icon: Icons.phone_outlined, hint: 'Enter your phone number', keyboardType: TextInputType.phone),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: textDarkColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              // Navigate to OTP screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OtpVerificationScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get OTP', style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?', style: TextStyle(color: textGrayColor)),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Log In', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  TextField _buildTextField({required IconData icon, required String hint, TextInputType? keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
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
}
