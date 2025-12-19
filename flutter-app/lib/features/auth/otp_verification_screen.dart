import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart'; // Import the new home screen

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
            _buildOtpForm(context),
            const SizedBox(height: 32),
            _buildResendLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Verify Phone Number',
          style: GoogleFonts.lexend(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textDarkColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the OTP sent to your number.',
          textAlign: TextAlign.center,
          style: GoogleFonts.lexend(
            fontSize: 16,
            color: textGrayColor,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        children: [
          // In a real app, you might use a package for the OTP input fields.
          // For this mock, a simple text field will suffice.
          _buildTextField(icon: Icons.pin_outlined, hint: 'Enter OTP', keyboardType: TextInputType.number),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: textDarkColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              // Mock verification: Navigate to the new HomeScreen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false, // This predicate removes all previous routes
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Verify & Proceed', style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResendLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Didn\'t receive the code?', style: TextStyle(color: textGrayColor)),
        TextButton(
          onPressed: () { /* TODO: Implement resend OTP logic */ },
          child: const Text('Resend', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  TextField _buildTextField({required IconData icon, required String hint, TextInputType? keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: TextAlign.center, // Center the OTP input
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 8),
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
