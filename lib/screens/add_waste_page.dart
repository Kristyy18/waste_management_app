import 'package:flutter/material.dart';
import '../data/waste_data.dart';

class AddWastePage extends StatefulWidget {
  const AddWastePage({super.key});

  @override
  State<AddWastePage> createState() => _AddWastePageState();
}

class _AddWastePageState extends State<AddWastePage> {
  final name = TextEditingController();
  final co2 = TextEditingController();

  void add() {
    if (name.text.isEmpty || co2.text.isEmpty) return;

    WasteData.addWaste({
      "name": name.text,
      "co2": double.tryParse(co2.text) ?? 0,
    });

    setState(() {});

    name.clear();
    co2.clear();
  }

  Widget buildBox({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isNumber = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.green),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FF),

      appBar: AppBar(
        title: const Text("Add Waste"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🟢 HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.teal],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Add Waste Data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 INPUT FIELDS
            buildBox(controller: name, hint: "Waste Name", icon: Icons.delete),

            buildBox(
              controller: co2,
              hint: "CO2 Value",
              icon: Icons.cloud,
              isNumber: true,
            ),

            const SizedBox(height: 5),

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
                onPressed: add,
                child: const Text("Add Waste"),
              ),
            ),

            const SizedBox(height: 15),

            // 🟢 LIST
            Expanded(
              child: ListView.builder(
                itemCount: WasteData.wasteList.length,
                itemBuilder: (context, i) {
                  final item = WasteData.wasteList[i];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.green, Colors.teal],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(
                      leading: const Icon(Icons.eco, color: Colors.white),

                      title: Text(
                        item["name"].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: Text(
                        "${item["co2"]} CO2",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
