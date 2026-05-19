import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Do you really want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              // 👉 Login page redirect (optional)
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (_) => const LoginPage()),
              // );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FF),

      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.green, Colors.teal]),
          ),
        ),
      ),

      body: FadeTransition(
        opacity: _fadeAnimation,

        child: ListView(
          padding: const EdgeInsets.all(12),

          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(Icons.settings, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "App Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Premium Eco Waste Settings",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            _buildCard(
              icon: Icons.info,
              title: "About App",
              text: "Eco Waste App tracks waste & CO2 emission 🌱",
              color: Colors.green,
            ),

            _buildCard(
              icon: Icons.person,
              title: "Developer Info",
              text: "Kristy Chakraborty - Flutter Developer",
              color: Colors.teal,
            ),

            _buildCard(
              icon: Icons.help,
              title: "Help & Support",
              text: "Contact: support@ecowaste.com",
              color: Colors.blue,
            ),

            _buildCard(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              text: "We do not collect personal data 🔐",
              color: Colors.green,
            ),

            const SizedBox(height: 10),

            // 🟢 SOFT LOGOUT CARD (NO RED BUTTON)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.logout, color: Colors.white),
                ),

                title: const Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                subtitle: const Text("Sign out from this device"),

                trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                onTap: () => logout(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String text,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,

      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
