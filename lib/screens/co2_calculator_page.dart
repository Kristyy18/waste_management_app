import 'package:flutter/material.dart';

class CO2CalculatorPage extends StatefulWidget {
  const CO2CalculatorPage({super.key});

  @override
  State<CO2CalculatorPage> createState() => _CO2CalculatorPageState();
}

class _CO2CalculatorPageState extends State<CO2CalculatorPage> {
  final controller = TextEditingController();
  double result = 0;

  void calculate() {
    double value = double.tryParse(controller.text) ?? 0;

    setState(() {
      result = value * 2.5; // logic SAME
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FF),

      appBar: AppBar(
        title: const Text("CO2 Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // 🟢 HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Icon(Icons.cloud, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "CO2 Impact Calculator 🌱",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 INPUT BOX
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.eco, color: Colors.green),
                  hintText: "Enter waste amount (kg)",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: calculate,
                child: const Text("Calculate CO2"),
              ),
            ),

            const SizedBox(height: 25),

            // 🟢 RESULT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.teal],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(Icons.co2, color: Colors.white, size: 40),
                  const SizedBox(height: 10),
                  const Text(
                    "CO2 Result",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$result kg CO2",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
