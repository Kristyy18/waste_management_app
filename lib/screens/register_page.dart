import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String error = "";

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slide = Tween(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  InputDecoration inputStyle(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.green),
      labelText: label,
      filled: true,
      fillColor: Colors.green.shade50,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.green.shade100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
    );
  }

  void registerUser() {
    if (password.text != confirmPassword.text) {
      setState(() {
        error = "Passwords not match";
      });
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E7D32), Color(0xFF26A69A)],
          ),
        ),

        child: Center(
          child: FadeTransition(
            opacity: _fade,

            child: SlideTransition(
              position: _slide,

              child: Container(
                width: 320, // ✅ SMALL BOX FIX
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Icon(Icons.eco, size: 50, color: Colors.green),

                    const SizedBox(height: 10),

                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    TextField(
                      controller: email,
                      decoration: inputStyle("Email", Icons.email),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: inputStyle("Password", Icons.lock),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: confirmPassword,
                      obscureText: true,
                      decoration: inputStyle(
                        "Confirm Password",
                        Icons.lock_outline,
                      ),
                    ),

                    const SizedBox(height: 10),

                    if (error.isNotEmpty)
                      Text(error, style: const TextStyle(color: Colors.red)),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: registerUser,
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
