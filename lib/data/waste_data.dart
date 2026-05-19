class WasteData {
  static List<Map<String, dynamic>> wasteList = [];

  static void addWaste(Map<String, dynamic> item) {
    wasteList.add(item);
  }

  static void deleteWaste(int index) {
    wasteList.removeAt(index);
  }

  static int get totalWaste => wasteList.length;

  static double get totalCO2 {
    double total = 0;
    for (var item in wasteList) {
      total += item["co2"];
    }
    return total;
  }
}