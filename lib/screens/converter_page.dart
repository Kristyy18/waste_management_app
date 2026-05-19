import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final controller = TextEditingController();

  double result = 0;

  String from = "kg";
  String to = "grams";

  void convert() {
    double value = double.tryParse(controller.text) ?? 0;

    setState(() {
      if (from == "kg" && to == "grams") {
        result = value * 1000;
      } else if (from == "grams" && to == "kg") {
        result = value / 1000;
      } else {
        result = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FF),

      appBar: AppBar(
        title: const Text("Waste Converter"),
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
              child: const Text(
                "Waste Converter 🌱",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 INPUT BOX (PREMIUM STYLE)
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
                  prefixIcon: Icon(Icons.swap_horiz, color: Colors.green),
                  hintText: "Enter value",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🟢 DROPDOWNS CARD
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    value: from,
                    items: const [
                      DropdownMenuItem(value: "kg", child: Text("kg")),
                      DropdownMenuItem(value: "grams", child: Text("grams")),
                    ],
                    onChanged: (val) {
                      setState(() {
                        from = val!;
                      });
                    },
                  ),

                  const Icon(Icons.arrow_forward, color: Colors.green),

                  DropdownButton(
                    value: to,
                    items: const [
                      DropdownMenuItem(value: "kg", child: Text("kg")),
                      DropdownMenuItem(value: "grams", child: Text("grams")),
                    ],
                    onChanged: (val) {
                      setState(() {
                        to = val!;
                      });
                    },
                  ),
                ],
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
                onPressed: convert,
                child: const Text("Convert"),
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 RESULT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.teal],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Result: $result",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
