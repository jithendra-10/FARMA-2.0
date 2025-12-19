import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistantChatScreen extends StatelessWidget {
  const AssistantChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color surfaceColor = isDarkMode ? const Color(0xFF1A2C22) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10), // AppBar + ProgressBar
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: textColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Column(
                children: [
                  const Text(
                    'STEP 1 OF 5',
                    style: TextStyle(color: Color(0xFF13EC6A), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                  Text('Location Details', style: TextStyle(color: textColor, fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              ),
              centerTitle: true,
              actions: [const SizedBox(width: 56)], // Balance the leading icon
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.2, // 1/5
                  backgroundColor: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF13EC6A)),
                  minHeight: 6,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [ _buildAssistantMessage(context, isDarkMode) ],
              ),
            ),
            _buildInputSection(context, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildAssistantMessage(BuildContext context, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDFBYgrSlRDO9FVl7kRkhfdV0NzE9dkzbIBd4F0q4VvTRUNoUBsveTslfd0CK1IBZeaU1lloh8qvfCaJtuDJqRSQ5eeBCqKCec6jfsodmcMJIFS8YGNRq1uxKRZrPbUeHMQkUnyBPlmwAgfKKWTkDATcZu-WjsyDR0q4Dhz5teA00b7trNOJZiwKy9RKSreyXoeOgStZTlSaAP8hrL4jShpzpGnqcD6NT0yii99kTiOTnPsPNh3-R_dVFdPzK9Os49B0R4D4Lg-OAY'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Bubble + Replay
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF1A2C22) : Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight: Radius.circular(20), 
                      bottomRight: Radius.circular(20)
                    ),
                  ),
                  child: const Text(
                    'Hello! To give you the best advice for your crops, I need to know where your farm is located.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_up_outlined, color: Color(0xFF13EC6A)),
                  label: const Text('Replay Question', style: TextStyle(color: Color(0xFF13EC6A), fontWeight: FontWeight.bold)),
                  style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputSection(BuildContext context, bool isDarkMode) {
    final Color inputFillColor = isDarkMode ? const Color(0xFF1A2C22) : Colors.white;
    final Color inputBorderColor = isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Search for village, city...',
              filled: true,
              fillColor: inputFillColor,
              prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 28),
              suffixIcon: const Icon(Icons.mic, color: Colors.grey, size: 28),
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: inputBorderColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: inputBorderColor)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFF13EC6A), width: 2)),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.my_location),
            label: const Text('Use Current Location', style: TextStyle(fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              foregroundColor: const Color(0xFF13EC6A),
              side: const BorderSide(color: Color(0xFF13EC6A)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 64),
              backgroundColor: const Color(0xFF13EC6A),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              padding: const EdgeInsets.only(left: 24, right: 8)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Next Step', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                CircleAvatar(backgroundColor: Colors.black12, child: Icon(Icons.arrow_forward, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
