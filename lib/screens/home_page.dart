import 'package:flutter/material.dart';

import 'add_waste_page.dart';
import 'dashboard_page.dart';
import 'search_page.dart';
import 'converter_page.dart';
import 'co2_calculator_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int index = 0;

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  final pages = const [
    HomeView(),
    AddWastePage(),
    DashboardPage(),
    SearchPage(),
    ConverterPage(),
    CO2CalculatorPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slide = Tween(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeTab(int i) {
    setState(() {
      index = i;
      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: pages[index]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: changeTab,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dash"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: "Convert",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "CO2"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  IconData getIcon(String name) {
    switch (name) {
      case "Plastic":
        return Icons.local_drink;
      case "Paper":
        return Icons.description;
      case "Glass":
        return Icons.wine_bar;
      case "Food Waste":
        return Icons.fastfood;
      case "Metal":
        return Icons.build;
      case "Battery":
        return Icons.battery_full;
      case "E-Waste":
        return Icons.devices;
      case "Rubber":
        return Icons.circle;
      case "Organic":
      case "Organic Waste":
        return Icons.eco;
      case "Textile":
        return Icons.checkroom;
      case "Cardboard":
        return Icons.inventory_2;
      case "Wood Waste":
        return Icons.nature;
      case "Aluminum":
        return Icons.hardware;
      case "Steel Scrap":
        return Icons.construction;
      case "Medical Waste":
        return Icons.medical_services;
      case "Electronic Parts":
        return Icons.memory;
      case "Garden Waste":
        return Icons.local_florist;
      case "Plastic Bottles":
        return Icons.local_drink;
      default:
        return Icons.eco;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {"name": "Plastic", "co2": 5},
      {"name": "Paper", "co2": 2},
      {"name": "Glass", "co2": 1},
      {"name": "Food Waste", "co2": 3},
      {"name": "Metal", "co2": 4},
      {"name": "Battery", "co2": 6},
      {"name": "E-Waste", "co2": 7},
      {"name": "Rubber", "co2": 2},
      {"name": "Organic Waste", "co2": 1},
      {"name": "Textile", "co2": 3},
      {"name": "Cardboard", "co2": 2},
      {"name": "Wood Waste", "co2": 3},
      {"name": "Aluminum", "co2": 4},
      {"name": "Steel Scrap", "co2": 5},
      {"name": "Medical Waste", "co2": 8},
      {"name": "Electronic Parts", "co2": 6},
      {"name": "Garden Waste", "co2": 2},
      {"name": "Plastic Bottles", "co2": 5},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,

      itemBuilder: (context, i) {
        final item = items[i];

        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 500 + (i * 50)),
          tween: Tween<double>(begin: 0, end: 1),

          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },

          child: Container(
            margin: const EdgeInsets.only(bottom: 12),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.circular(16),

              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  getIcon(item["name"].toString()),
                  color: Colors.green,
                ),
              ),

              title: Text(
                item["name"].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: const Text(
                "Eco Friendly Waste 🌱",
                style: TextStyle(color: Colors.white70),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    "${item["co2"]} CO2",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(Icons.eco, color: Colors.white),

                  const SizedBox(width: 5),

                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
